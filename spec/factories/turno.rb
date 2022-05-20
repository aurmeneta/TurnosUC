# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :turno do
    dia { %w[Lunes Martes Miércoles Jueves Viernes Sabádo].sample }
    direccion_salida { Faker::Address.full_address }
    hora_salida { '07:30' }
    tipo { %w[Ida Vuelta].sample }
    cupos { rand(1...10) }
    campus { ['San Joaquín', 'Casa Central', 'Lo Contador', 'Oriente', 'Villarrica'].sample }
    association :usuario
  end
end
