require 'rails_helper'

describe 'Projects', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /projects' do
    it 'returns all projects' do
      FactoryGirl.create_list(:project, 3)

      get '/projects'

      expect(response.status).to eq 200
    end
  end

  describe 'GET /projects/:id' do
    it 'returns the specified project' do
      FactoryGirl.create :project, id: 1

      get '/projects/1'

      expect(response.status).to eq 200
    end
  end

  describe 'POST /projects' do
    it 'creates the specified project' do
      FactoryGirl.create(:client, id: 1)
      FactoryGirl.create(:project_type, id: 1)
      project_request = attributes_for(:project, client_id: 1, project_type_id: 1)

      post '/projects',
           params: project_request.to_json,
           headers: {
             'Content-Type' => 'application/json',
             'Authorization' => user.access_token
           }

      expect(response.status).to eq 201
    end
  end

  describe 'PUT /projects/:id' do
    it 'updates the specified project' do
      FactoryGirl.create :project, id: 1

      project_request = {
        id: 1,
        startDate: 2.days.ago
      }

      put '/projects/1',
          params: project_request.to_json,
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => user.access_token
          }

      expect(response.status).to eq 200
    end
  end

  describe 'DELETE /projects/:id' do
    it 'deletes the specified project' do
      FactoryGirl.create :project, id: 1

      delete '/projects/1',
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

      expect(response.status).to eq 204
    end
  end
end
