require 'faker'

FactoryBot.define do
  factory :resena do
    association :usuario
    association :autor, factory: :usuario
    contenido { Faker::Quote.famous_last_words }
    calificacion { rand(1..5) }
  end
end
