# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Usuarios', type: :request do
  let!(:usuario) { create(:usuario) }

  before(:each) do
    @usuario_params = {
      email: Faker::Internet.email,
      nombre: Faker::Name.name,
      imagen_perfil: Faker::Internet.url,
      direccion: Faker::Address.full_address,
      telefono: '912345678',
      password: 'password',
      password_confirmation: 'password'
    }
  end

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

  describe 'create user' do
    it 'should create a new user' do
      expect do
        post '/', params: { usuario: @usuario_params }
      end.to change(Usuario, :count).by(1)
    end
  end

  describe 'update user' do
    it 'should update a user' do
      usuario.nombre = Faker::Name.name
      put '/', params: { usuario: usuario }
      expect(response).to have_http_status(:found)
    end
  end
end
