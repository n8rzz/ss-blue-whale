require 'rails_helper'

describe 'TaskItems', :type => :request do
  describe 'GET /taskItems' do
    it 'returns all task_items' do
      FactoryGirl.create_list(:task_item, 3)

      get '/taskItems'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body.size).to eq 3
    end
  end

  describe 'GET /taskItems/:id' do
    it 'returns the specified project' do
      FactoryGirl.create :task_item_with_project_types, id: 1

      get '/taskItems/1'

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('task_item')
    end
  end

  describe 'POST /taskItems' do
    it 'creates the specified task_item' do
      task_item_request = attributes_for(:task_item_with_project_types)

      post '/taskItems',
           params: task_item_request.to_json,
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 201
      # expect(response).to match_response_schema('task_item')
    end
  end

  describe 'PUT /taskItems/:id' do
    it 'updates the specified task_item' do
      FactoryGirl.create :task_item, id: 100
      FactoryGirl.create :task_item, id: 200
      FactoryGirl.create :task_item, id: 1

      project_request = {
        name: 'Some Other Name',
        project_type: [100, 200]
      }

      put '/taskItems/1',
          params: project_request.to_json,
          headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      # puts body
      # expect(body['project_type'].size).to eq 2
      # expect(response).to match_response_schema('task_item')
    end
  end

  describe 'DELETE /taskItems/:id' do
    it 'deletes the specified project' do
      FactoryGirl.create :task_item, id: 1

      delete '/taskItems/1'

      expect(response.status).to eq 204
    end
  end
end
