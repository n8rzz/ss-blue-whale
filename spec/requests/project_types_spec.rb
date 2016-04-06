require 'rails_helper'

describe 'ProjectTypes', :type => :request do
  describe 'GET /project_types' do
    it 'returns all project_types' do
      FactoryGirl.create_list(:project_type, 3)

      get '/project_types'

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_types')
    end
  end

  describe 'GET /project_types/:id' do
    it 'returns the specified project' do
      FactoryGirl.create :project_type, id: 1

      get '/project_types/1'

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'POST /project_types' do
    it 'creates the specified project_type' do
      project_type_request = attributes_for(:project_type)

      post '/project_types',
           params: project_type_request.to_json,
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 201
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'PUT /project_types/:id' do
    it 'updates the specified project_type' do
      FactoryGirl.create :project_type, id: 1

      project_request = {
        name: 'Some Other Name'
      }

      put '/project_types/1',
          params: project_request.to_json,
          headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200
      # expect(response).to match_response_schema('project_type')
    end
  end

  describe 'DELETE /project_types/:id' do
    it 'deletes the specified project' do
      FactoryGirl.create :project_type, id: 1

      delete '/project_types/1'

      expect(response.status).to eq 204
    end
  end
end
