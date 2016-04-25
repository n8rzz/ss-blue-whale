require 'rails_helper'

describe TimeEntriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/timeEntries').to route_to('time_entries#index')
    end

    it 'routes to #show' do
      expect(:get => '/timeEntries/1').to route_to('time_entries#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/timeEntries').to route_to('time_entries#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/timeEntries/1').to route_to('time_entries#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/timeEntries/1').to route_to('time_entries#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/timeEntries/1').to route_to('time_entries#destroy', :id => '1')
    end
  end
end
