class SolicitudsController < ApplicationController
  def index
    @solicituds = Solicitud.all
  end

  def create
    @solicitud = Solicitud.new(
      descripcion: "pendiente",
      usuario_id: 1,
      turno_id: params[:turno_id]
    )
    @solicitud.save 
  end

  def delete
    Solicitud.find(params[])
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  def update
    Solicitud.update(
      params[:id],
      descripcion: solicitud_params[:descripcion]
    )

    redirect_to Solicitud.find(params[:id])
  end


  private
    def solicitud_params
      params.require(:solicitud)
    end

end

