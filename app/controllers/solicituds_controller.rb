class SolicitudsController < ApplicationController
  def index
    @solicituds = Solicitud.all
  end

  def create
    @Solicitud = Solicitud.new(
      descripcion: params[:descripcion]
    )
  end

  def delete
    Solicitud.find(params[])
  end

  def edit
  end

  def update
  end
end
