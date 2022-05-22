# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Resenas', type: :request do
  let(:usuario) { create(:usuario) }
  let(:autor) { create(:usuario) }

  before(:each) do
    @resena = create(:resena, autor_id: autor.id, usuario_id: usuario.id)
  end

  describe 'get resenas' do
    it 'should return resenas' do
      sign_in usuario
      get "/resenas/#{usuario.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create resenas' do
    it 'request with valid params should create a new resena' do
      sign_in autor
      expect do
        post "/resenas/#{usuario.id}", params: {
          contenido: Faker::Quote.famous_last_words,
          calificacion: rand(1..5)
        }
      end.to change(Resena, :count).by(1)
    end

    it 'request with no calificion should not create a new resena' do
      sign_in autor
      expect do
        post "/resenas/#{usuario.id}", params: {
          contenido: Faker::Quote.famous_last_words
        }
      end.to change(Resena, :count).by(0)
    end

    it 'request with out of range calificion should not create a new resena' do
      sign_in autor
      expect do
        post "/resenas/#{usuario.id}", params: {
          contenido: Faker::Quote.famous_last_words,
          calificacion: rand(6..30)
        }
      end.to change(Resena, :count).by(0)
    end

    it 'request with no contenido should not create a new resena' do
      sign_in autor
      expect do
        post "/resenas/#{usuario.id}", params: {
          calificacion: rand(1..5)
        }
      end.to change(Resena, :count).by(0)
    end

    it 'request with no user logged in should not create a new resena' do
      expect do
        post "/resenas/#{usuario.id}", params: {
          contenido: Faker::Quote.famous_last_words,
          calificacion: rand(1..5)
        }
      end.to change(Resena, :count).by(0)
    end
  end

  describe 'update resenas' do
    it 'should redirect if user that is not the author tries to edit' do
      sign_in usuario
      get "/resenas/#{@resena.usuario.id}/#{@resena.id}/edit"
      expect(response).to have_http_status(302)
    end

    it 'should return form if author tries to edit' do
      sign_in autor
      get "/resenas/#{@resena.usuario.id}/#{@resena.id}/edit"
      expect(response).to have_http_status(:ok)
    end

    it 'should update resena if new calificacion is valid' do
      sign_in autor
      new_cal = rand(1..5)
      patch "/resenas/#{@resena.usuario.id}/#{@resena.id}", params: {
        resena: {
          calificacion: new_cal,
          contenido: @resena.contenido
        }
      }
      expect(Resena.find(@resena.id).calificacion).to eq(new_cal)
    end

    it 'should update resena if new contenido is valid' do
      sign_in autor
      new_cont = Faker::Quote.famous_last_words
      patch "/resenas/#{@resena.usuario.id}/#{@resena.id}", params: {
        resena: {
          calificacion: @resena.calificacion,
          contenido: new_cont
        }
      }
      expect(Resena.find(@resena.id).contenido).to eq(new_cont)
    end

    it 'should not update resena if new contenido is not valid' do
      sign_in autor
      new_cont = Faker::Quote.famous_last_words
      patch "/resenas/#{@resena.usuario.id}/#{@resena.id}", params: {
        resena: {
          calificacion: @resena.calificacion,
          contenido: nil
        }
      }
      expect(Resena.find(@resena.id).contenido).to eq(@resena.contenido)
    end

    it 'should not update resena if new calificacion is not valid' do
      sign_in autor
      patch "/resenas/#{@resena.usuario.id}/#{@resena.id}", params: {
        resena: {
          calificacion: rand(6..30),
          contenido: @resena.contenido
        }
      }
      expect(Resena.find(@resena.id).calificacion).to eq(@resena.calificacion)
    end

    it 'should not update resena if editor is not the author' do
      sign_in usuario
      patch "/resenas/#{@resena.usuario.id}/#{@resena.id}", params: {
        resena: {
          calificacion: rand(1..5),
          contenido: @resena.contenido
        }
      }
      expect(Resena.find(@resena.id).calificacion).to eq(@resena.calificacion)
    end
  end

  describe 'delete resenas' do
    it 'should delete a resena' do
      sign_in autor
      expect do
        delete "/resenas/#{@resena.usuario.id}/#{@resena.id}"
      end.to change(Resena, :count).by(-1)
    end

    it 'should not delete a resena if logged user is not the author' do
      sign_in usuario
      expect do
        delete "/resenas/#{@resena.usuario.id}/#{@resena.id}"
      end.to change(Resena, :count).by(0)
    end
  end
end
