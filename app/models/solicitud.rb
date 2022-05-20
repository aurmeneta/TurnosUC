# frozen_string_literal: true

class Solicitud < ApplicationRecord
  belongs_to :turno
  belongs_to :usuario

  validates :descripcion, inclusion: { in: %w[Aceptada Rechazada Pendiente] }
  validates :usuario, :turno, presence: true

  def to_s
    "Solititud ##{id} para #{turno}"
  end
end
