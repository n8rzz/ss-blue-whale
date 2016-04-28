require 'rails_helper'

describe RegistrationsController, :type => :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/users').to route_to('registrations#index')
    end

    it 'routes to #create' do
      expect(:post => '/users').to route_to('registrations#create')
    end

    it 'routes to #update' do
      expect(:put => '/users/1').to route_to('registrations#update', :id => '1')
    end
  end
end
