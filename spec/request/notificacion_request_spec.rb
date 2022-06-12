# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notificacion', type: :request do
  let(:usuario) { create(:usuario) }
  let(:otro_usuario) { create(:usuario) }
  let(:notificacion) { create(:notificacion, usuario_id: usuario.id) }

  describe 'dismiss notificacion' do
    it 'should not dismiss the notificacion if it is not for the user' do
      sign_in otro_usuario

      post dismiss_notificacion_path(notificacion)

      expect(Notificacion.find(notificacion.id).visto).to eq(false)
    end

    it 'should dismiss the notificacion if it is for the user' do
      sign_in usuario

      post dismiss_notificacion_path(notificacion)

      expect(Notificacion.find(notificacion.id).visto).to eq(true)
    end
  end
end
