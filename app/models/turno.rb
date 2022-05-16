# frozen_string_literal: true

class Turno < ApplicationRecord
  belongs_to :usuario
  has_many :solicituds
  has_many :mensajes

  validates :usuario_id, :direccion_salida, presence: true
  validates :dia, inclusion: { in: %w[Lunes Martes Miércoles Jueves Viernes Sabádo] }
  validates :hora_salida, format: { with: /[0-9]{1,2}:[0-9]{2}/ }
  validates :tipo, inclusion: { in: %w[Ida Vuelta] }
  validates :cupos, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :campus, inclusion: { in: ['San Joaquín', 'Casa Central', 'Oriente', 'Lo Contador', 'Villarrica'] }


  def usuario_en_turno(id_usuario)
    if self.usuario.id == id_usuario
      return true
    else
      self.solicituds.each do |solicitud|
        if solicitud.descripcion == "Aceptada" && solicitud.usuario.id == id_usuario
          return true
        end
      end
      return false  
    end
  end
end
