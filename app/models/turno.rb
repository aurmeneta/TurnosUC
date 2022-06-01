# frozen_string_literal: true

class Turno < ApplicationRecord
  belongs_to :usuario
  has_many :solicituds
  has_many :mensajes

  validates :usuario_id, :direccion_salida, :comuna, :fecha, presence: true
  validates :tipo, inclusion: { in: %w[Ida Vuelta] }
  validates :cupos, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :campus, inclusion: { in: ['San Joaquín', 'Casa Central', 'Oriente', 'Lo Contador', 'Villarrica'] }

  def usuario_en_turno(id_usuario)
    if usuario.id == id_usuario
      true
    else
      solicituds.each do |solicitud|
        return true if solicitud.descripcion == 'Aceptada' && solicitud.usuario.id == id_usuario
      end
      false
    end
  end

  def to_s
    if fecha and tipo == 'Ida'
      "#{I18n.l(fecha, format: '<%a %d/%m %H:%M>')} Turno ##{id} de #{direccion_salida}, #{comuna} a #{campus}"
    elsif fecha
      "#{fecha.strftime('<%a %d/%m %H:%M>')} Turno ##{id} el #{fecha} de #{campus} #{direccion_salida}, #{comuna}"
    elsif tipo == 'Ida'
      "<#{dia}> Turno ##{id} de #{direccion_salida}, #{comuna} a #{campus}"
    else
      "<#{dia}> Turno ##{id} el #{fecha} de #{campus} #{direccion_salida}, #{comuna}"
    end
  end
end
