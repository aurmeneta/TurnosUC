# frozen_string_literal: true


module UsuariosHelper

    def arroba_in_mail(mail)
        mail.include?('@')
    end

    def mails_length(mail)
        largo = mail.length
        largo > 5    
    end
   
    def mails_is_string(mail)
        mail_class = mail.class
        mail_class == String       
    end

    def id_is_integer(id)
        id_class = id.class
        id_class == Integer       
    end

    def nombre_is_string(nombre)
        nombre_class = nombre.class
        nombre_class == String       
    end

    def telefonos_length(telefono)
        largo = telefono.length
        largo == 9      
    end

    def passwords_length(password)
        largo = password.length
        largo > 5     
    end

end