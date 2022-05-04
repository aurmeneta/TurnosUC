require 'rails_helper.rb'


RSpec.describe "Solicituds", type: :request do
    let!(:usuario) { create(:usuario) }
    let!(:segundo_usuario) {create(:usuario)}
    let!(:turno) {create(:turno)}
    let!(:solicitud) {create(:solicitud)}
    let!(:segunda_solicitud) {create(:solicitud)}

    before(:each) {
        sign_in usuario
    }

    describe 'create solicitud' do
        it 'should create a new solicitud' do
            expect {
                post '/solicituds/create', params: {turno_id: turno.id}
            }.to change(Solicitud, :count).by(1)
        end
    end

    describe 'aceptar solicitud' do
        it 'should aceptar a solicitud' do
            sign_in solicitud.turno.usuario
            post "/solicitudes/aceptar/#{solicitud.id}"
            expect(Solicitud.find(solicitud.id).descripcion).to eq("Aceptada")          
        end
    end

    describe 'rechazar solicitud' do
        it 'should rechazar a solicitud' do
            sign_in solicitud.turno.usuario
            post "/solicitudes/rechazar/#{solicitud.id}"
            expect(Solicitud.find(solicitud.id).descripcion).to eq("Rechazada")
        end
    end

    describe 'delete solicitud' do
        it 'should delete a solicitud' do
            sign_in segunda_solicitud.usuario
            delete "/solicituds/#{segunda_solicitud.id}"
            expect(response).to have_http_status(:found)            
        end
    end
end
