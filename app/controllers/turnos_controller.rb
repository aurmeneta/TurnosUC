class TurnosController < ApplicationController

    def index
        @turnos = Turno.all
    end

    def new
        @test = "asad"
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
end
