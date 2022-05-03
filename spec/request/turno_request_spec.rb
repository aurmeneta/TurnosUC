require 'rails_helper.rb'


RSpec.describe "Turnos", type: :request do
    before(:each) {
      @attr_turn = {
        :id=> 1, 
        :dia => 'Lunes',
        :direccion_salida => 'Ida', 
        :hora_salida => "2000-01-01 12:00:00",
        :tipo => "Ida",
        :cupos => 4, 
        :campus => 'San Joaquín',
        :usuario_id => 1,
        :usuario => Usuario.new(id: 1, email: "email@prueba.com", nombre: "username", imagen_perfil: "https://www.google.com", direccion: "Alameda 123", telefono: "123456789", password: 'abcdefg')

        }
    }

    describe 'get' do
        it 'should return a successful request' do
            @turno = Turno.create!(@attr_turn)
            get '/turno/#{@turno.id}'
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'get_new' do
        it 'should return a successful request' do
            get '/crear_turno'
            expect(response).to have_http_status(:ok)
        end
    end


    describe 'edit' do
        it 'should return a successful request' do
            @turno = Turno.create!(@attr_turn)
            get "/turno/editar/#{@turno.id}"
            expect(response).to have_http_status(:ok)
            
        end
    end


    describe 'delete' do
        it 'should decrease count of Turnos by 1' do
            @turno = Turno.create!(@attr_turn)
            expect{
            delete "/turno/#{@turno.id}"
            }.to change(Turno, :count).by(-1)
            
        end
    end

end