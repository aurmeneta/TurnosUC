# frozen_string_literal: true
require 'uri'
require 'net/http'

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
    if usuario.id == id_usuario
      true
    else
      solicituds.each do |solicitud|
        return true if solicitud.descripcion == 'Aceptada' && solicitud.usuario.id == id_usuario
      end
      false
    end
  end

  def duracion_estimada
    url_maps = "https://maps.googleapis.com/maps/api/directions/json?key=#{ENV["GMAPS_KEY"]}"

    # Eliminar tilde
    campus = self.campus.gsub('í', 'i')

    if tipo == 'Ida'
      url_maps += "&origin=#{direccion_salida}&destination=Campus #{campus} UC&departure_time=now"
    else
      url_maps += "&origin=Campus #{campus} UC&destination=#{direccion_salida}&departure_time=now"
    end

    uri = URI(url_maps)
    http_response = Net::HTTP.get_response(uri)

    if http_response.is_a? Net::HTTPSuccess
      begin
        response = JSON.parse http_response.body
        response['routes'].first['legs'].first['duration_in_traffic']['text']
      rescue => exception
        'No se pudo estimar la duración del viaje'
      end
    else
      'No se pudo estimar la duración del viaje'
    end
  end

  def to_s
    if tipo == 'Ida'
      "Turno ##{id} #{tipo} de #{direccion_salida} a #{campus}"
    else
      "Turno ##{id} #{tipo} de #{campus} #{direccion_salida}"
    end
  end
end
