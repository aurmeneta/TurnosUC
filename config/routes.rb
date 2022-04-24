Rails.application.routes.draw do
  devise_for :usuarios
  root 'home#index'
end
