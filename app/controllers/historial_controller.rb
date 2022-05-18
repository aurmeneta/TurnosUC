class HistorialController < ApplicationController
    def index
        @turnos = current_usuario.turnos

        @solicitudes_aceptadas = current_usuario.solicituds.where('descripcion': 'Aceptada')
        @solicitudes_pendientes = current_usuario.solicituds.where('descripcion': 'Pendiente')
        @solicitudes_rechazadas = current_usuario.solicituds.where('descripcion': 'Rechazada')
    end
end
