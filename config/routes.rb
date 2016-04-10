Rails.application.routes.draw do
  resources :task_items, :path => 'taskItems'
  resources :project_types, :path => 'projectTypes'
  resources :projects
  resources :clients
end
