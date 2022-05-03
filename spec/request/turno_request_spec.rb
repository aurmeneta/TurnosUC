require 'rails_helper.rb'


RSpec.describe "Turnos", type: :request do


    describe 'get index' do
        it 'should return a successful request' do
            get '/'
            expect(response).to have_http_status(:ok)
        end
    end


end