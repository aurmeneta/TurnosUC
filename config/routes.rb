Rails.application.routes.draw do
  get 'solicituds/index'
  get 'solicituds/create'
  get 'solicituds/delete'
  get 'solicituds/edit'
  get 'solicituds/update'
  root 'home#index'
end
