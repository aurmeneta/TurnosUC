class Solicitud < ApplicationRecord
    belongs_to :turno
    belongs_to :usuario

    validates :descripcion, inclusion: {in: ["Aceptada", "Rechazada", "Pendiente"]}
    validates :usuario, :turno, presence: true
end
