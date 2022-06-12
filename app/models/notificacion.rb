class Notificacion < ApplicationRecord
  self.table_name = 'notificaciones'

  validates :usuario_id, :turno_id, :contenido, presence: true

  belongs_to :usuario
  belongs_to :turno

  def to_s
    "#{turno}: #{contenido}"
  end
end
