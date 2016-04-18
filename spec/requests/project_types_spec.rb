require 'rails_helper'

describe 'ProjectTypes', :type => :request do
  describe 'GET /projectTypes' do
    it 'returns all project_types' do
      FactoryGirl.create_list(:project_type, 3)

      get '/projectTypes'

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_types')
    end
  end

  describe 'GET /projectTypes/:id' do
    it 'returns the specified project_type' do
      FactoryGirl.create :project_type_with_tasks, id: 1

      get '/projectTypes/1'

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'POST /projectTypes' do
    it 'creates the specified project_type' do
      project_type_request = attributes_for(:project_type)

      post '/projectTypes',
           params: project_type_request.to_json,
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 201
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'PUT /projectTypes/:id' do
    it 'updates the specified project_type' do
      FactoryGirl.create :project_type_with_tasks, id: 1

      project_request = {
        name: 'Some Other Name'
      }

      put '/projectTypes/1',
          params: project_request.to_json,
          headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'DELETE /projectTypes/:id' do
    it 'deletes the specified project_type' do
      FactoryGirl.create :project_type, id: 1

      delete '/projectTypes/1'

      expect(response.status).to eq 204
    end
  end

  describe 'POST /projectTypes/:id/taskItems' do
    it 'adds task_items to the specified project_type' do
      FactoryGirl.create :task_item, id: 1
      FactoryGirl.create :task_item, id: 2
      FactoryGirl.create :project_type, id: 1

      project_type_request = {
        task_item_ids: [1, 2]
      }

      post '/projectTypes/1/taskItems',
           params: project_type_request.to_json,
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body['task_items'].size).to eq 2
    end

    it 'clears all task items if an empty request is made' do
      FactoryGirl.create :project_type, id: 1

      post '/projectTypes/1/taskItems',
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body['task_items']).to eq nil
    end
  end
end
