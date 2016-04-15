Rails.application.routes.draw do
  resources :task_items, :path => 'taskItems'
  resources :project_types, :path => 'projectTypes' do
    member do
      post 'taskItems', to: 'project_types#add_task_items'
    end
  end
  resources :projects
  resources :clients
end
