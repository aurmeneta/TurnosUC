# frozen_string_literal: true

class MensajesController < ApplicationController
  def create
    if Turno.find(params[:turno_id]).usuario_en_turno(current_usuario.id)
      @mensaje = Mensaje.new(
        turno_id: params[:turno_id],
        usuario_id: current_usuario.id,
        contenido: params[:mensaje]
      )

      if @mensaje.save
        redirect_to turno_path(params[:turno_id])
      else
        redirect_to turno_path(params[:turno_id]), alert: 'No se pudo envíar el mensaje'
      end
    else
      redirect_to turno_path(params[:turno_id]), alert: 'Debes estar en un turno para envíar un mensaje en su chat', status: :forbidden
    end
  end
end
