require 'rails_helper.rb'


RSpec.describe "Turnos", type: :request do
    let!(:turno) {create(:turno)}
    let!(:usuario) {create(:usuario)}

    before(:each) {
        sign_in usuario
    }

    describe 'get index' do
        it 'should return a successful request' do
            get '/'
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'get turno' do
        it 'should return a successful request' do
            get "/turno/#{turno.id}"
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'create turno' do
        it 'should create a new turno' do
            sign_in turno.usuario
            expect {
                post "/crear_turno/", params: {
                    dia: turno.dia,
                    direccion_salida: turno.direccion_salida,
                    hora_salida: turno.hora_salida,
                    tipo: turno.tipo,
                    cupos: turno.cupos,
                    campus: turno.campus
                }
            }.to change(Turno, :count).by(1)
        end
    end

    describe 'delete turno' do
        it 'should delete a turno' do
            sign_in turno.usuario
            expect {
                delete "/turno/#{turno.id}"
            }.to change(Turno, :count).by(-1)
        end
    end

    describe 'update turno' do
        it 'should update a turno' do
            sign_in turno.usuario
            turno.campus = "San Joaquín"
            patch "/turno/#{turno.id}", params: {
                turno: {
                    dia: turno.dia,
                    direccion_salida: turno.direccion_salida,
                    hora_salida: turno.hora_salida,
                    tipo: turno.tipo,
                    cupos: turno.cupos,
                    campus: turno.campus
                    }
                }
            expect(Turno.find(turno.id).campus).to eq("San Joaquín")
        end
    end


end
