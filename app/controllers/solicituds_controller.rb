class SolicitudsController < ApplicationController
  def create
    turno = Turno.find(params[:turno_id])

    if turno.usuario.id != current_usuario.id
      @solicitud = Solicitud.new(
        descripcion: "Pendiente",
        usuario_id: current_usuario.id,
        turno_id: turno.id
      )
      @solicitud.save
      redirect_to turno
    else
      redirect_to turno, alert: "No puedes solicitar un cupo en tu propio turno", status: 304
    end
  end

  def delete
    solicitud = Solicitud.find(params[:id])

    if solicitud.usuario.id == current_usuario.id
      solicitud.destroy
      redirect_to solicitud.turno
    else
      redirect_to solicitud.turno, alert: "Solo puedes eliminar solicitudes tuyas", status: 304
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
      redirect_to solicitud.turno, alert: "Solo el creador del turno puede aceptar/rechazar solicitudes", status: 304
    end
  end

  def aceptar
    solicitud = Solicitud.find(params[:id])

    if solicitud.turno.usuario.id == current_usuario.id
      solicitud.update(descripcion: "Aceptada")
      redirect_to solicitud.turno
    else
      redirect_to solicitud.turno, alert: "Solo el creador del turno puede aceptar/rechazar solicitudes", status: 304
    end
  end

  def rechazar
    solicitud = Solicitud.find(params[:id])

    if solicitud.turno.usuario.id == current_usuario.id
      solicitud.update(descripcion: "Rechazada")
      redirect_to solicitud.turno
    else
      redirect_to solicitud.turno, alert: "Solo el creador del turno puede aceptar/rechazar solicitudes", status: 304
    end

  end


  private
    def solicitud_params
      params.require(:solicitud)
    end

end
