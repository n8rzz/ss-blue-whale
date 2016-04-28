require 'rails_helper'

describe SessionsController, :type => :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(:post => '/login').to route_to('sessions#create')
    end
  end
end
