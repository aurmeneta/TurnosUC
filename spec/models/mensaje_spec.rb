# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mensaje, type: :model do
  let(:usuario) { create(:usuario) }
  let(:turno) { create(:turno) }

  before(:each) do
    @mensaje = Mensaje.new(usuario_id: usuario.id, turno_id: turno.id, contenido: Faker::Quote.famous_last_words)
  end

  it 'is valid with valid attributes' do
    expect(@mensaje).to be_valid
  end

  it 'is not valid without contenido' do
    @mensaje.contenido = nil
    expect(@mensaje).not_to be_valid
  end

  it 'is not valid with empty contenido' do
    @mensaje.contenido = ''
    expect(@mensaje).not_to be_valid
  end

  it 'is not valid without turno' do
    @mensaje.turno_id = nil
    expect(@mensaje).not_to be_valid
  end

  it 'is not valid without usuario' do
    @mensaje.usuario_id = nil
    expect(@mensaje).not_to be_valid
  end
end
