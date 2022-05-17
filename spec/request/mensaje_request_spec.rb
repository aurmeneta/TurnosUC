# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mensajes', type: :request do
  let(:usuario) { create(:usuario) }
  let(:turno) { create(:turno) }

  describe 'create mensaje' do
    it 'should create mensaje if author is turno creator' do
      sign_in turno.usuario
      expect do
        post "/turnos/#{turno.id}/mensajes", params: {
          mensaje: Faker::Quote.famous_last_words
        }
      end.to change(Mensaje, :count).by(1)
    end

    it 'should not create mensaje if mensaje is empty' do
      sign_in turno.usuario
      expect do
        post "/turnos/#{turno.id}/mensajes", params: {
          mensaje: ''
        }
      end.to change(Mensaje, :count).by(0)
    end

    it 'should not create mensaje if author is not in the turno' do
      sign_in usuario
      expect do
        post "/turnos/#{turno.id}/mensajes", params: {
          mensaje: Faker::Quote.famous_last_words
        }
      end.to change(Mensaje, :count).by(0)
    end

    it 'should create mensaje if author is in the turno' do
      sign_in usuario

      solicitud = Solicitud.new(descripcion: 'Aceptada', usuario_id: usuario.id, turno_id: turno.id)
      solicitud.save

      expect do
        post "/turnos/#{turno.id}/mensajes", params: {
          mensaje: Faker::Quote.famous_last_words
        }
      end.to change(Mensaje, :count).by(1)
    end
  end
end
