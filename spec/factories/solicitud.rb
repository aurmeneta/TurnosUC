# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :solicitud do
    descripcion { %w[Pendiente Rechazada Aceptada].sample }
    association :usuario
    association :turno
  end
end
