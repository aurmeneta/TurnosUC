# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Solicitud, type: :model do

  before(:each) do
    @usuario_1 = Usuario.new(id: 1, email: Faker::Internet.email, nombre: Faker::Name.name, imagen_perfil: Faker::Internet.url, direccion: Faker::Address.full_address, telefono: "912345678", password: 'abcdefg')
    @usuario_2 = Usuario.new(id: 1, email: Faker::Internet.email, nombre: Faker::Name.name, imagen_perfil: Faker::Internet.url, direccion: Faker::Address.full_address, telefono: "912345678", password: 'abcdefg')
    @turno = Turno.new(id: 1, dia: "Lunes", direccion_salida: Faker::Address.full_address, hora_salida: "12:00:00", tipo: "Ida", cupos: 4, campus: 'San Joaquín', created_at: nil, updated_at: nil, usuario: @usuario_1)
    @solicitud = Solicitud.new(id: 1, turno: @turno, usuario: @usuario_2, descripcion: "Pendiente")
  end

  it 'is valid with valid attributes' do
    expect(@solicitud).to be_valid
  end

  it 'is not valid without turno' do
    @solicitud.turno = nil
    expect(@solicitud).not_to be_valid
  end

  it 'is not valid without usuario' do
    @solicitud.usuario = nil
    expect(@solicitud).not_to be_valid
  end

  it 'is not valid without descripción' do
    @solicitud.descripcion = nil
    expect(@solicitud).not_to be_valid
  end

  it 'is not valid with invalid descripción' do
    @solicitud.descripcion = "Cancelada"
    expect(@solicitud).not_to be_valid
  end
end
