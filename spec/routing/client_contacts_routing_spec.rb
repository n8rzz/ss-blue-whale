require 'rails_helper'

RSpec.describe ClientContactsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/clientContacts').to route_to('client_contacts#index')
    end

    it 'routes to #show' do
      expect(:get => '/clientContacts/1').to route_to('client_contacts#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/clientContacts').to route_to('client_contacts#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/clientContacts/1').to route_to('client_contacts#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/clientContacts/1').to route_to('client_contacts#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/clientContacts/1').to route_to('client_contacts#destroy', :id => '1')
    end

    it 'routes to clients/notes#create' do
      expect(:post => '/clients/1/notes').to route_to('clients/notes#create', :client_id => '1')
    end

    it 'routes to clients/notes#update' do
      expect(:put => '/clients/1/notes/1').to route_to('clients/notes#update', :client_id => '1', :id => '1')
    end

    it 'routes to clients/notes#delete' do
      expect(:delete => '/clients/1/notes/1').to route_to('clients/notes#destroy', :client_id => '1', :id => '1')
    end
  end
end
