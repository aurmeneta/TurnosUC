# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Turnos', type: :request do
  let!(:turno) { create(:turno) }
  let!(:usuario) { create(:usuario) }

  before(:each) do
    sign_in usuario
  end

  describe 'get index' do
    it 'should return a successful request' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get turno' do
    it 'should return a successful request' do
      get "/turnos/#{turno.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create turno' do
    it 'should create a new turno' do
      sign_in turno.usuario
      expect do
        post '/turnos/', params: {
          fecha: turno.fecha,
          direccion_salida: turno.direccion_salida,
          comuna: turno.comuna,
          tipo: turno.tipo,
          cupos: turno.cupos,
          campus: turno.campus
        }
      end.to change(Turno, :count).by(1)
    end
  end

  describe 'delete turno' do
    it 'should delete a turno' do
      sign_in turno.usuario
      expect do
        delete "/turnos/#{turno.id}"
      end.to change(Turno, :count).by(-1)
    end
  end

  describe 'update turno' do
    it 'should update a turno' do
      sign_in turno.usuario
      turno.campus = 'San Joaquín'
      patch "/turnos/#{turno.id}", params: {
        turno: {
          fecha: turno.fecha,
          direccion_salida: turno.direccion_salida,
          comuna: turno.comuna,
          tipo: turno.tipo,
          cupos: turno.cupos,
          campus: turno.campus
        }
      }
      expect(Turno.find(turno.id).campus).to eq('San Joaquín')
    end
  end
end
