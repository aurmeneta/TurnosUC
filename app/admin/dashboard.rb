# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do 
      column do
        panel 'Turnos recientes' do
          ul do
            Turno.order(updated_at: :desc).limit(10).map do |turno|
              li link_to(turno, admin_turno_path(turno))
            end
          end
        end
      end

      column do
        panel 'Últimas reseñas' do
          ul do
            Resena.order(updated_at: :desc).limit(10).map do |resena|
              li link_to(resena, admin_resena_path(resena))
            end
          end
        end
      end
    end

    columns do 
      column do
        panel 'Últimas solicitudes' do
          ul do
            Solicitud.order(updated_at: :desc).limit(10).map do |solicitud|
              li link_to(solicitud, admin_solicitud_path(solicitud))
            end
          end
        end
      end

      column do
        panel 'Últimos mensajes' do
          ul do
            Mensaje.order(updated_at: :desc).limit(10).map do |mensaje|
              li link_to(mensaje, admin_mensaje_path(mensaje))
            end
          end
        end
      end
    end


  columns do
    column do
      panel 'Usuarios' do
        ul do
          Usuario.all.map do |usuario|
            li link_to(usuario, admin_usuario_path(usuario))
          end
        end
      end
    end
  end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
