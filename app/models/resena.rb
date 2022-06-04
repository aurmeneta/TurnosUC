# frozen_string_literal: true

class Resena < ApplicationRecord
  belongs_to :usuario
  belongs_to :autor, class_name: 'Usuario'

  validates :usuario_id, :autor_id, :calificacion, :contenido, presence: true
  validates :calificacion, numericality: { only_integer: true,
                                           greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


  def to_s
    "Reseña #{id} de #{autor} a #{usuario}"
  end
end
