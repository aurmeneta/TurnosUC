# frozen_string_literal: true

class ResenasController < ApplicationController
  def index
    @usuario = Usuario.find(params[:usuario_id])
  end

  def create
    @resena = Resena.new(
      calificacion: params[:calificacion],
      contenido: params[:contenido],
      usuario_id: params[:usuario_id],
      autor_id: current_usuario.id
    )

    if @resena.save
      redirect_to resenas_path(params[:usuario_id])

    else
      render :new, status: 422
    end
  end

  def edit
    @resena = Resena.find(params[:resena_id])

    redirect_to @turno, alert: 'No puedes editar esta reseña' if @resena.autor_id != current_usuario.id
  end

  def update
    # Comprobar si editor es publicador del turno
    @resena = Resena.find(params[:resena_id])

    if @resena.autor_id == current_usuario.id

      if @resena.update(
        calificacion: resena_params[:calificacion],
        contenido: resena_params[:contenido]
      )
        redirect_to turnos_path, notice: 'Cambios guardados'
      else
        redirect_to turnos_path, alert: 'Error'
      end
    else
      redirect_to turnos_path, alert: 'No puedes editar este elemento'
    end
  end

  def delete
    resena = Resena.find(params[:resena_id])

    if resena.autor_id == current_usuario.id
      resena.destroy
      redirect_to turnos_path
    else
      redirect_to turnos, alert: 'Solo puedes eliminar reseñas tuyas'
    end
  end

  private

  def resena_params
    params.require(:resena)
  end
end
