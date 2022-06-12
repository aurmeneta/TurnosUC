# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :notificacion do
    contenido { Faker::Quote.famous_last_words }
    association :turno
    association :usuario
    visto { false }
  end
end
