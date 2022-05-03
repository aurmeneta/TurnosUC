class Turno < ApplicationRecord
    belongs_to :usuario
    has_many :solicitud
  
    validates :usuario, :direccion_salida, presence: true
    validates :dia, inclusion: {in: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabádo"]}
    validates :hora_salida, format: {with: /[0-9]{1,2}:[0-9]{2}/}
    validates :tipo, inclusion: {in: ["Ida", "Vuelta"]}
    validates :cupos, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :campus, inclusion: {in: ["San Joaquín", "Casa Central", "Oriente", "Lo Contador", "Villarrica"]}

end
