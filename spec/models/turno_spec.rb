# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Turno, type: :model do
  before(:each) do
    @usuario = Usuario.new(id: 1, email: Faker::Internet.email, nombre: Faker::Name.name, imagen_perfil: Faker::Internet.url, direccion: Faker::Address.full_address, telefono: "912345678", password: 'abcdefg')
    @turno = Turno.new(id: 1, dia: "Lunes", direccion_salida: Faker::Address.full_address, hora_salida: "12:00:00", tipo: "Ida", cupos: 4, campus: 'San Joaquín', created_at: nil, updated_at: nil, usuario: @usuario)
  end

  it 'is valid with valid attributes' do
    expect(@turno).to be_valid
  end

  it 'is not valid with no day' do
    @turno.dia = nil
    expect(@turno).not_to be_valid
  end

  it 'is not valid with no slots' do
    @turno.cupos = nil
    expect(@turno).not_to be_valid
  end

  it 'is not valid with no type' do
    @turno.tipo = nil
    expect(@turno).not_to be_valid
  end

  it 'is not valid without time' do
    @turno.hora_salida = nil
    expect(@turno).not_to be_valid
  end

  it 'is not valid with invalid campus' do
    @turno.campus = "Beauchef"
    expect(@turno).not_to be_valid
  end
end
