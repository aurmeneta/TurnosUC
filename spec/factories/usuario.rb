require 'faker'

FactoryBot.define do
    factory :usuario do
        email { Faker::Internet.email }
        nombre { Faker::Name.name }
        imagen_perfil { Faker::Internet.url }
        direccion { Faker::Address.full_address }
        telefono { "912345678" }
        password { "password" }
        password_confirmation { "password" }
    end
end
