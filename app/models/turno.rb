# frozen_string_literal: true
require 'uri'
require 'net/http'

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
