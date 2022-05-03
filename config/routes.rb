Rails.application.routes.draw do
  root 'turnos#index'

  get 'crear_turno', to: 'turnos#new', as: :new_turno
  post 'crear_turno', to: 'turnos#create', as: :turnos
  get 'turno/:id', to: 'turnos#turno', as: :turno
  delete 'turno/:id', to: 'turnos#delete', as: :delete_turno
  patch 'turno/:id', to: 'turnos#update', as: :patch_turno
  get 'turno/editar/:id', to: 'turnos#edit', as: :edit_turno


  post 'solicituds/create', to: 'solicituds#create', as: :new_solicitud
  get 'solicituds/:id', to: 'solicituds#show', as: :solicitud
  get 'solicituds/editar/:id', to: 'solicituds#edit', as: :edit_solicitud
  patch 'solicituds/:id', to: 'solicituds#update', as: :patch_solicitud
  delete 'solicituds/:id', to: 'solicituds#delete', as: :delete_solicitud
  post 'solicitudes/aceptar/:id', to: 'solicituds#aceptar', as: :aceptar_solicitud
  post 'solicitudes/rechazar/:id', to: 'solicituds#rechazar', as: :rechazar_solicitud

end
