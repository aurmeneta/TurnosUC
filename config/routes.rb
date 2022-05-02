Rails.application.routes.draw do
  devise_for :usuarios, :controllers => {
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations'
  },
  :path => '', :path_names => {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
    edit: 'perfil'
  }

  root 'home#index'
  get 'publicaciones', to: 'turnos#index', as: :show_turns
  get 'crear_turno', to: 'turnos#new', as: :new_turno
  post 'crear_turno', to: 'turnos#create', as: :turnos
  get 'turno/:id', to: 'turnos#turno', as: :turno
  delete 'turno/:id', to: 'turnos#delete'
  patch 'turno/:id', to: 'turnos#update', as: :patch_turno
  get 'turno/editar/:id', to: 'turnos#edit', as: :edit_turno

end
