# frozen_string_literal: true

Rails.application.routes.draw do
  get 'resenas/index', to: 'resenas#index', as: :resenas
  get 'resenas/new', to: 'resenas#new', as: :new_resena
  get 'resenas/create'
  get 'resenas/edit', to: 'resenas#edit', as: :edit_resena
  get 'resenas/update'
  get 'resenas/delete'
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
end
