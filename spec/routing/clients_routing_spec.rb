require 'rails_helper'

describe ClientsController, :type => :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/clients').to route_to('clients#index')
    end

    it 'routes to #show' do
      expect(:get => '/clients/1').to route_to('clients#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/clients').to route_to('clients#create')
    end

    it 'routes to #update' do
      expect(:put => '/clients/1').to route_to('clients#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/clients/1').to route_to('clients#destroy', :id => '1')
    end

    it 'routes to clients/notes#create' do
      expect(:post => '/clients/1/notes').to route_to('clients/notes#create', :client_id => '1')
    end

    it 'routes to clients/notes#delete' do
      expect(:delete => '/clients/1/notes/1').to route_to('clients/notes#destroy', :client_id => '1', :id => '1')
    end
  end
end
