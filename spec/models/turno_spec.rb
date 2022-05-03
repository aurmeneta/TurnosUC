# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Turno, type: :model do
  before(:each) do
    @usuario = Usuario.new(id: 1, email: "email@prueba.com", nombre: "username", imagen_perfil: "https://www.google.com", direccion: "Alameda 123", telefono: "123456789", password: 'abcdefg')
    @turno = Turno.new(id: 1, dia: "Lunes", direccion_salida: 'direccion', hora_salida: "2000-01-01 12:00:00", tipo: "Ida", cupos: 4, campus: 'San Joaquín', created_at: nil, updated_at: nil, usuario_id: 1, usuario: @usuario)
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

end