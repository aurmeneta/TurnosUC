# frozen_string_literal: true

class SolicitudsController < ApplicationController
  def create
    turno = Turno.find(params[:turno_id])

    if turno.usuario.id == current_usuario.id
      redirect_to turno, alert: 'No puedes solicitar un cupo en tu propio turno'
    elsif turno.usuario_solicito? current_usuario
      redirect_to turno, alert: 'Ya enviaste una solicitud a este turno'
    else
      @solicitud = Solicitud.new(
        descripcion: 'Pendiente',
        usuario_id: current_usuario.id,
        turno_id: turno.id
      )
      @solicitud.save

      Notificacion.new(
        contenido: "#{current_usuario.nombre} envió una solicitud",
        turno_id: turno.id,
        usuario_id: turno.usuario.id
      ).save

      redirect_to turno
    end
  end

  def delete
    solicitud = Solicitud.find(params[:id])

    if solicitud.usuario.id == current_usuario.id
      solicitud.destroy
      redirect_to solicitud.turno
    else
      redirect_to solicitud.turno, alert: 'Solo puedes eliminar solicitudes tuyas'
    end
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  def update
    solicitud = Solicitud.find(params[:id])

    if solicitud.turno.usuario.id == current_usuario.id
      solicitud.update(descripcion: solicitud_params[:descripcion])
      redirect_to solicitud.turno
    else
      redirect_to solicitud.turno, alert: 'Solo el creador del turno puede aceptar/rechazar solicitudes'
    end
  end

  def aceptar
    solicitud = Solicitud.find(params[:id])

    if solicitud.turno.usuario.id == current_usuario.id
      if solicitud.update(descripcion: 'Aceptada')

        Notificacion.new(
          contenido: "#{solicitud.turno.usuario.nombre} aceptó tu solicitud",
          turno_id: solicitud.turno.id,
          usuario_id: solicitud.usuario.id
        ).save

        redirect_to solicitud.turno
      else
        redirect_to solicitud.turno, alert: 'No se pudo aceptar la solicitud'
      end
    else
      redirect_to solicitud.turno, alert: 'Solo el creador del turno puede aceptar/rechazar solicitudes'
    end
  end

  def rechazar
    solicitud = Solicitud.find(params[:id])

    if solicitud.turno.usuario.id == current_usuario.id
      if solicitud.update(descripcion: 'Rechazada')
        Notificacion.new(
          contenido: "#{solicitud.turno.usuario.nombre} rechazó tu solicitud",
          turno_id: solicitud.turno.id,
          usuario_id: solicitud.usuario.id
        ).save

        redirect_to solicitud.turno
      else
        redirect_to solicitud.turno, alert: 'No se pudo rechazar la solicitud'
      end
    else
      redirect_to solicitud.turno, alert: 'Solo el creador del turno puede aceptar/rechazar solicitudes'
    end
  end

  private

  def solicitud_params
    params.require(:solicitud)
  end
end
