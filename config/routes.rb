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
end
