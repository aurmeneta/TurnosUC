Rails.application.routes.draw do
  root 'turnos#index'
  get 'crear_turno', to: 'turnos#new', as: :new_turno
  post 'crear_turno', to: 'turnos#create', as: :turnos
  get 'turno/:id', to: 'turnos#turno', as: :turno
  delete 'turno/:id', to: 'turnos#delete'
  patch 'turno/:id', to: 'turnos#update', as: :patch_turno
  get 'turno/editar/:id', to: 'turnos#edit', as: :edit_turno
end
