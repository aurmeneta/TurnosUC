require 'rails_helper'

RSpec.describe 'Historial', type: :request do
    let(:usuario) { create(:usuario) }
    let(:turno) { create(:turno, usuario_id: usuario.id) }
    let(:solicitud) { create(:solicitud, usuario_id: usuario.id) }

    describe 'get historial' do
        it 'should return the historial' do
            sign_in usuario
            get '/historial'

            expect(response).to have_http_status(:ok)
        end

        it 'should redirect if no user is logged in' do
            get '/historial'
            expect(response).to have_http_status(302)
        end
    end
end
