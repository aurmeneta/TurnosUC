# frozen_string_literal: true

class NotificacionesController < ApplicationController
  def dismiss
    notificacion = Notificacion.find(params[:notificacion_id])
    
    if notificacion.usuario.id == current_usuario.id
        notificacion.update(visto: true)
        redirect_to root_path
    end
  end
end
