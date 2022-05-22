# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Resena, type: :model do
  let(:usuario) { create(:usuario) }
  let(:autor) { create(:usuario) }

  before(:each) do
    @resena = Resena.new(usuario_id: usuario.id, autor_id: autor.id, calificacion: rand(1...5), contenido: Faker::Quote.famous_last_words)
  end

  it 'is valid with valid attributes' do
    expect(@resena).to be_valid
  end

  it 'is not valid without author' do
    @resena.autor_id = nil
    expect(@resena).not_to be_valid
  end

  it 'is not valid without usuario' do
    @resena.usuario_id = nil
    expect(@resena).not_to be_valid
  end

  it 'is not valid without calificacion' do
    @resena.calificacion = nil
    expect(@resena).not_to be_valid
  end

  it 'is not valid without contenido' do
    @resena.contenido = nil
    expect(@resena).not_to be_valid
  end

  it 'is not valid with out of range calificacion' do
    @resena.calificacion = rand(6..30)
    expect(@resena).not_to be_valid
  end
end
