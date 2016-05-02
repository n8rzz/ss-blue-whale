Rails.application.routes.draw do
  devise_for :users, skip: :all
  resources :users, only: [:index, :create, :update], controller: :registrations
  resource :login, only: [:create], controller: :sessions

  resources :projects do
    resources :notes, module: :projects, only: [:create, :update, :destroy]
  end

  resources :clients do
    resources :notes, module: :clients, only: [:create, :update, :destroy]
  end

  resources :client_contacts, :path => 'clientContacts'
  resources :time_entries, :path => 'timeEntries'
  resources :task_items, :path => 'taskItems' do
    member do
      post 'projectTypes', to: 'task_items#add_project_types'
    end
  end

  resources :project_types, :path => 'projectTypes' do
    member do
      post 'taskItems', to: 'project_types#add_task_items'
    end
  end
end
