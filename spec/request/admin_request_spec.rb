# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin', type: :request do
    let(:admin) { create(:usuario, admin: true) }
    let(:usuario) { create(:usuario, admin: false) }

    describe 'get dashboard' do
        it 'should redirect if not admin' do
            sign_in usuario
            get '/admin'

            expect(response).to have_http_status(302)
        end

        it 'should be successful if admin' do
            sign_in admin
            get '/admin'

            expect(response).to have_http_status(:ok)
        end
    end
end
