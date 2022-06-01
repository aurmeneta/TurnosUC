# frozen_string_literal: true

class TurnosController < ApplicationController
  skip_before_action :authenticate_usuario!, only: %w[index show]

  def index
    @turnos = Turno.all
  end

  def create
    @turno = Turno.new(
      fecha: params[:fecha],
      direccion_salida: params[:direccion_salida],
      comuna: params[:comuna],
      tipo: params[:tipo],
      cupos: params[:cupos],
      campus: params[:campus],
      usuario_id: current_usuario.id
    )

    if @turno.save
      redirect_to @turno
    else
      render :new, status: 422
    end
  end

  def show
    @turno = Turno.find(params[:id])
    @maps_url = URI.encode("https://www.google.com/maps/embed/v1/place?key=#{ENV['GMAPS_KEY']}&q=#{@turno.direccion_salida},#{@turno.comuna}")
  end

  def destroy
    turno = Turno.find(params[:id])

    if turno.usuario.id == current_usuario.id
      turno.destroy
      redirect_to root_path
    else
      redirect_to turno, alert: 'Solo puedes eliminar tus propios turnos'
    end
  end

  def edit
    @turno = Turno.find(params[:id])

    redirect_to @turno, alert: 'No puedes editar este turno' if @turno.usuario_id != current_usuario.id
  end

  def update
    # Comprobar si editor es publicador del turno
    @turno = Turno.find(params[:id])

    if @turno.usuario_id == current_usuario.id

      if @turno.update(
        comuna: turno_params[:comuna],
        direccion_salida: turno_params[:direccion_salida],
        fecha: turno_params[:fecha],
        tipo: turno_params[:tipo],
        cupos: turno_params[:cupos],
        campus: turno_params[:campus]
      )
        redirect_to @turno, notice: 'Cambios guardados'
      else
        redirect_to @turno, alert: @turno.errors.full_messages
      end
    else
      redirect_to @turno, alert: 'No puedes editar este elemento'
    end
  end

  private

  def turno_params
    params.require(:turno)
  end
end
