# frozen_string_literal: true

class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :direccion, presence: true
  validates :nombre, presence: true
  validates :telefono, format: { with: /[0-9]{9}/ }

  has_many :turnos
  has_many :solicituds
  has_many :mensajes
  has_many :resenas, class_name: 'Resena', foreign_key: :usuario_id
  has_many :resenas_escritas, class_name: 'Resena', foreign_key: :autor_id
  has_many :notificaciones, class_name: 'Notificacion'

  has_one_attached :foto_perfil

  def avatar_perfil
    if foto_perfil.attached?
      foto_perfil
    elsif imagen_perfil.present? and not imagen_perfil.empty?
      imagen_perfil
    else
      'https://www.computerhope.com/jargon/g/guest-user.jpg'
    end
  end

  def notificaciones_nuevas
    notificaciones.where(visto: false)
  end

  def to_s
    "[#{id}] #{nombre} (#{email})"
  end
end
