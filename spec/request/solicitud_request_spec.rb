# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Solicituds', type: :request do
  let!(:usuario) { create(:usuario) }
  let!(:segundo_usuario) { create(:usuario) }
  let!(:turno) { create(:turno, usuario_id: usuario.id) }
  let!(:solicitud) { create(:solicitud) }
  let!(:segunda_solicitud) { create(:solicitud) }

  before(:each) do
    sign_in segundo_usuario
  end

  describe 'create solicitud' do
    it 'should create a new solicitud' do
      expect do
        post new_solicitud_path, params: { turno_id: turno.id }
      end.to change(Solicitud, :count).by(1)
    end

    it 'should not create a new solicitud if usuario already has one' do
      post new_solicitud_path, params: { turno_id: turno.id }

      expect do
        post new_solicitud_path, params: { turno_id: turno.id }
      end.to change(Solicitud, :count).by(0)
    end

    it 'should not create a new solicitud if usuario y publisher of the turno' do
      sign_in usuario
      expect do
        post new_solicitud_path, params: { turno_id: turno.id }
      end.to change(Solicitud, :count).by(0)
    end
  end

  describe 'aceptar solicitud' do
    it 'should aceptar a solicitud' do
      sign_in solicitud.turno.usuario
      post "/solicitudes/aceptar/#{solicitud.id}"
      expect(Solicitud.find(solicitud.id).descripcion).to eq('Aceptada')
    end
  end

  describe 'rechazar solicitud' do
    it 'should rechazar a solicitud' do
      sign_in solicitud.turno.usuario
      post "/solicitudes/rechazar/#{solicitud.id}"
      expect(Solicitud.find(solicitud.id).descripcion).to eq('Rechazada')
    end
  end

  describe 'delete solicitud' do
    it 'should delete a solicitud' do
      sign_in segunda_solicitud.usuario
      delete "/solicituds/#{segunda_solicitud.id}"
      expect(response).to have_http_status(:found)
    end
  end

  describe 'update solicitud' do
    it 'should update a solicitud' do
      sign_in segunda_solicitud.turno.usuario
      patch "/solicituds/#{segunda_solicitud.id}", params: {
        solicitud: {
          descripcion: 'Pendiente'
        }
      }
      expect(Solicitud.find(segunda_solicitud.id).descripcion).to eq('Pendiente')
    end
  end
end
