# frozen_string_literal: true

class Mensaje < ApplicationRecord
  validates :usuario_id, :turno_id, :contenido, presence: true

  belongs_to :usuario
  belongs_to :turno

  def to_s
    "#{usuario} para #{turno}: #{contenido}"
  end
end
