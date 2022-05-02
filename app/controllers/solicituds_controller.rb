class SolicitudsController < ApplicationController
  def index
    @solicituds = Solicitud.all
  end

  def create
    @Solicitud = Solicitud.new(
      descripcion: "pendiente",
      usuario_id: 1,
      turno_id: params[:turno_id]
    )
    @Solicitud.save 
  end

  def delete
    Solicitud.find(params[])
  end

  def edit
  end

  def update
  end
end
