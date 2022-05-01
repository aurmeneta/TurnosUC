class Turno < ApplicationRecord

    def initialize hash
        super hash
        @errors = []
    end

    def save
        @errors = []
        parametro_invalido = false
        
        # Comprobar parametros
        if self.dia.empty?
            puts "Día inválido"
            @errors << "Día inválido"
            parametro_invalido = true
        end

        if self.direccion_salida.empty?
            puts "Dirección inválida"
            @errors << "Dirección inválida"
            parametro_invalido = true
        end

        if !self.hora_salida
            puts "Hora salida inválida"
            @errors << "Hora salida inválida"
            parametro_invalido = true
        end

        if self.tipo.empty?
            puts "Tipo inválido"
            @errors << "Tipo inválido"
            parametro_invalido = true
        end

        if !self.cupos
            puts "Cupos inválidos"
            @errors << "Cupos inválidos"
            parametro_invalido = true
        end

        if self.campus.empty?
            puts "Campus inválido"
            @errors << "Campus inválido"
            parametro_invalido = true
        end

        if parametro_invalido
            false
        else
            super
        end
    end

    def errors
        return @errors
    end
end
