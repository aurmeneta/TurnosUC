class MensajesController < ApplicationController
    def create
        @mensaje = Mensaje.new(
            turno_id: params[:turno_id],
            usuario_id: current_usuario.id,
            contenido: params[:mensaje]
        )

        if @mensaje.save
            redirect_to turno_path(params[:turno_id])
        else
            redirect_to turno_path(params[:turno_id]), alert: "No se pudo envíar el mensaje"
        end
    end
end
