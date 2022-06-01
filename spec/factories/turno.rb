# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :turno do
    dia { %w[Lunes Martes Miércoles Jueves Viernes Sabádo].sample }
    direccion_salida { Faker::Address.street_address }
    comuna { Faker::Address.city }
    fecha { Faker::Time.forward }
    tipo { %w[Ida Vuelta].sample }
    cupos { rand(1...10) }
    campus { ['San Joaquín', 'Casa Central', 'Lo Contador', 'Oriente', 'Villarrica'].sample }
    association :usuario
  end
end
