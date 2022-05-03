require 'rails_helper.rb'


RSpec.describe "Usuarios", type: :request do

    describe 'get login' do
        it 'should return a successful request' do
            get '/login'
            expect(response).to have_http_status(:ok)
        end
    end


    describe 'get register' do
        it 'should return a successful request' do
            get '/register'
            expect(response).to have_http_status(:ok)
        end
    end



end