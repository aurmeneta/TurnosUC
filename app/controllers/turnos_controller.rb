# frozen_string_literal: true

class TurnosController < ApplicationController
  skip_before_action :authenticate_usuario!, only: :index

  def index
    @turnos = Turno.all
  end

  def new
    @turno = Turno.new
  end

  def create
    @turno = Turno.new(turno_params)
    @turno.usuario = current_usuario

    respond_to do |format|
      if @turno.save
        format.html { redirect_to turno_url(@turno), notice: 'Se creó el turno' }
      else
        format.html { render :new, status: 422 }
      end
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
      respond_to do |format|
        if @turno.update(turno_params)
          format.html { redirect_to @turno, notice: 'Cambios guardados' }
        else
          format.html { render :edit, status: 422 }
        end
      end
    else
      redirect_to @turno, alert: 'No puedes editar este elemento'
    end
  end

  private

  def turno_params
    params.require(:turno).permit(%i[fecha direccion_salida comuna campus tipo cupos hora_salida dia usuario_id])
  end
end
