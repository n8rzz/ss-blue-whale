require 'rails_helper'

describe TaskItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/taskItems').to route_to('task_items#index')
    end

    it 'routes to #show' do
      expect(:get => '/taskItems/1').to route_to('task_items#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/taskItems').to route_to('task_items#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/taskItems/1').to route_to('task_items#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/taskItems/1').to route_to('task_items#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/taskItems/1').to route_to('task_items#destroy', :id => '1')
    end

    it 'routes to #add_project_types via POST' do
      expect(:post => '/taskItems/1/projectTypes').to route_to('task_items#add_project_types', :id => '1')
    end
  end
end
