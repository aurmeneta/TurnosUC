require 'faker'

FactoryBot.define do
    factory :solicitud do
        descripcion { ["Pendiente", "Rechazada", "Aceptada"].sample }
        association :usuario
        association :turno
    end
end
