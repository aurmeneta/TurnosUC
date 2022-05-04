   
require 'rails_helper'
include UsuariosHelper

RSpec.describe 'Usuarios', type: :request do

    describe 'Usuarios helper methods' do

        it 'should return true' do
            mail = 'test@email.com'
            arroba_in_mail(mail).should eq(true)
        end

        it 'should return false' do
            mail = '@a'
            mails_length(mail).should eq(false)
        end

        it 'should return false' do
            mail = 1243565
            mails_is_string(mail).should eq(false)
        end

        it 'should return true' do
            id = 8
            id_is_integer(id).should eq(true)
        end

        it 'should return true' do
            nombre = 'username'
            nombre_is_string(nombre).should eq(true)
        end

        it 'should return true' do
            telefono = '123456789'
            telefonos_length(telefono).should eq(true)
        end

        it 'should return true' do
            password = "abcdef"
            passwords_length(password).should eq(true)
        end
    end
end
