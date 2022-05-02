class TurnosController < ApplicationController
    skip_before_action :authenticate_usuario!, only: ["index"]

    def index
        @turnos = Turno.all
    end

    def create
        @turno = Turno.new(
            dia: params[:dia],
            direccion_salida: params[:direccion_salida],
            hora_salida: params[:hora_salida],
            tipo: params[:tipo],
            cupos: params[:cupos],
            campus: params[:campus]
        )

        
        if @turno.save
            redirect_to "/turno/#{@turno.id}"
        else
            render :new, status: 422
        end
    end

    def turno
        @turno = Turno.find(params[:id])
    end

    def delete
        Turno.find(params[:id]).destroy
        redirect_to root_path
    end

    def edit
        @turno = Turno.find(params[:id])
    end

    def update
        Turno.update(
            params[:id],
            dia: turno_params[:dia],
            direccion_salida: turno_params[:direccion_salida],
            hora_salida: turno_params[:hora_salida],
            tipo: turno_params[:tipo],
            cupos: turno_params[:cupos],
            campus: turno_params[:campus]
        )

        redirect_to Turno.find(params[:id])
    end

    private
        def turno_params
            params.require(:turno)
        end

end
