# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations'
  },
                        path: '', path_names: {
                          sign_in: 'login',
                          sign_out: 'logout',
                          sign_up: 'register',
                          edit: 'perfil'
                        }

  root 'turnos#index'
  get 'historial', to: 'historial#index', as: :historial

  resources :turnos do
    resources :mensajes
  end

  post 'solicituds/create', to: 'solicituds#create', as: :new_solicitud
  get 'solicituds/:id', to: 'solicituds#show', as: :solicitud
  get 'solicituds/editar/:id', to: 'solicituds#edit', as: :edit_solicitud
  patch 'solicituds/:id', to: 'solicituds#update', as: :patch_solicitud
  delete 'solicituds/:id', to: 'solicituds#delete', as: :delete_solicitud
  post 'solicitudes/aceptar/:id', to: 'solicituds#aceptar', as: :aceptar_solicitud
  post 'solicitudes/rechazar/:id', to: 'solicituds#rechazar', as: :rechazar_solicitud

  get 'resenas/:usuario_id/', to: 'resenas#index', as: :resenas
  get 'resenas/:usuario_id/new', to: 'resenas#new', as: :new_resena
  post 'resenas/:usuario_id/', to: 'resenas#create'
  get 'resenas/:usuario_id/:resena_id', to: 'resenas#show', as: :resena
  get 'resenas/:usuario_id/:resena_id/edit', to: 'resenas#edit', as: :edit_resena
  patch 'resenas/:usuario_id/:resena_id', to: 'resenas#update'
  delete 'resenas/:usuario_id/:resena_id', to: 'resenas#delete'

  post 'notificaciones/descartar/:notificacion_id', to: 'notificaciones#dismiss', as: :dismiss_notificacion
end
