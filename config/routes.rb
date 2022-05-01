Rails.application.routes.draw do
  root 'turnos#index'
  get 'crear_turno', to: 'turnos#new', as: :new_turno
  post 'crear_turno', to: 'turnos#create', as: :turnos
  get 'turno/:id', to: 'turnos#turno', as: :turno
end
