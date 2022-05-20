# frozen_string_literal: true

class Resena < ApplicationRecord
  belongs_to :usuario
  belongs_to :autor, class_name: "Usuario"

  validates :usuario_id, :autor_id, :calificacion, presence: true
end
