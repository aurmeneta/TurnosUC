require 'rails_helper'
include TurnosHelper

RSpec.describe 'Turnos', type: :request do
    describe 'Turnos helper methods' do
        it 'should return true' do
            campuses_is_string('Casa Central').should eq(true)
        end

        it 'should return true' do
            dia = 'Martes'
            dia_is_string(dia).should eq(true)
        end

        it 'should return true' do
            tipo = 'Ida'
            tipos_is_string(tipo).should eq(true)
        end

        it 'should return true' do
            cupo = 5
            cupos_is_integer(cupo).should eq(true)
        end
    end
end