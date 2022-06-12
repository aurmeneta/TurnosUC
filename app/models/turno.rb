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
  validate :fecha_must_be_in_the_future

  def fecha_must_be_in_the_future
    if fecha.present? and fecha < Time.now
      errors.add :fecha, 'no puede ser en el pasado'
    end
  end

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

  def usuario_solicito? (usuario)
    not solicituds.where(usuario_id: usuario.id).empty?
  end

  def hora_llegada
    url_maps = "https://maps.googleapis.com/maps/api/directions/json?key=#{ENV["GMAPS_KEY"]}"

    if tipo == 'Ida'
      url_maps += "&origin=#{direccion_salida},#{comuna}&destination=Campus #{campus} UC"
    else
      url_maps += "&origin=Campus #{campus} UC&destination=#{direccion_salida},#{comuna}"
    end

    if fecha and fecha > Time.now
      url_maps += "&departure_time=#{fecha.to_i}"
    else
      url_maps += "&departure_time=now"
    end

    uri = URI(URI.encode(url_maps))
    http_response = Net::HTTP.get_response(uri)

    if http_response.is_a? Net::HTTPSuccess
      begin
        response = JSON.parse http_response.body
        duracion_texto = response['routes'].first['legs'].first['duration_in_traffic']['text']
        duracion_segundos = response['routes'].first['legs'].first['duration_in_traffic']['value']

        if fecha and fecha > Time.now
          (fecha + duracion_segundos).strftime('%H:%M') + " (#{duracion_texto} de viaje)"
        else
          duracion_texto + ' de viaje'
        end

      rescue => exception
        puts 'Error en google maps', http_response.body, exception
        'No se pudo estimar la duración del viaje'
      end
    else
      puts 'Error en google maps', http_response.body
      'No se pudo estimar la duración del viaje'
    end
  end

  def to_s
    if fecha and tipo == 'Ida'
      "#{I18n.l(fecha, format: '<%a %d/%m %H:%M>')} Turno ##{id} de #{direccion_salida}, #{comuna} a #{campus}"
    elsif fecha
      "#{I18n.l(fecha, format: '<%a %d/%m %H:%M>')} Turno ##{id} de #{campus} a #{direccion_salida}, #{comuna}"
    elsif tipo == 'Ida'
      "<#{dia}> Turno ##{id} de #{direccion_salida}, #{comuna} a #{campus}"
    else
      "<#{dia}> Turno ##{id} el #{fecha} de #{campus} #{direccion_salida}, #{comuna}"
    end
  end
end
