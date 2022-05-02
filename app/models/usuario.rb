class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :direccion, presence: true
  validates :nombre, presence: true
  validates :imagen_perfil, presence: true
  validates :telefono, format: {with: /[0-9]{9}/}
end
