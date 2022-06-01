# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Turno, type: :model do
  let(:usuario) { create(:usuario)}
  before(:each) do
    @turno = Turno.new(id: 1, fecha: Faker::Date.forward, direccion_salida: Faker::Address.street_address, comuna: Faker::Address.city,
                       tipo: 'Ida', cupos: 4, campus: 'San Joaquín', created_at: nil, updated_at: nil, usuario_id: usuario.id)
  end

  it 'is valid with valid attributes' do
    expect(@turno).to be_valid
  end

  it 'is not valid with no comuna' do
    @turno.comuna = nil
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

  it 'is not valid without date' do
    @turno.fecha = nil
    expect(@turno).not_to be_valid
  end

  it 'is not valid with invalid campus' do
    @turno.campus = 'Beauchef'
    expect(@turno).not_to be_valid
  end
end
