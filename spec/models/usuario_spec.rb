# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Usuario, type: :model do
  before(:each) do
    @usuario = Usuario.new(id: 1, email: 'email@prueba.com', nombre: 'username',
                           imagen_perfil: 'https://www.google.com', direccion: 'Alameda 123', telefono: '123456789', password: 'abcdefg')
  end

  it 'is valid with valid attributes' do
    expect(@usuario).to be_valid
  end

  it 'is not valid without name' do
    @usuario.nombre = nil
    expect(@usuario).not_to be_valid
  end

  it 'is not valid without address' do
    @usuario.direccion = nil
    expect(@usuario).not_to be_valid
  end

  it 'is not valid without a phone number' do
    @usuario.telefono = nil
    expect(@usuario).not_to be_valid
  end
end
