class SolicitudsController < ApplicationController
  def index
    @solicituds = Solicitud.all
  end

  def create
    @solicitud = Solicitud.new(
      descripcion: "Pendiente",
      usuario_id: 1,
      turno_id: params[:turno_id]
    )
    @solicitud.save

    redirect_to @solicitud.turno
  end

  def delete
    solicitud = Solicitud.find(params[:id])
    solicitud.destroy
    redirect_to solicitud.turno
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  def update
    Solicitud.update(
      params[:id],
      descripcion: solicitud_params[:descripcion]
    )

    redirect_to Solicitud.find(params[:id]).turno
  end

  def aceptar
    @solicitud = Solicitud.find(params[:id])
    @solicitud.update(descripcion: "Aceptada")
    redirect_to @solicitud.turno
  end

  def rechazar
    @solicitud = Solicitud.find(params[:id])
    @solicitud.update(descripcion: "Rechazada")
    redirect_to @solicitud.turno
  end


  private
    def solicitud_params
      params.require(:solicitud)
    end

end
