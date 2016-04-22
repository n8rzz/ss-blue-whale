require 'rails_helper'

describe 'ProjectTypes', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /projectTypes' do
    before :each do
      FactoryGirl.create_list(:project_type, 3)
    end

    context 'with authorization' do
      it 'returns all project_types' do
        get '/projectTypes',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/projectTypes'
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'GET /projectTypes/:id' do
    before :each do
      FactoryGirl.create :project_type_with_tasks, id: 1
    end

    context 'with authorization' do
      it 'returns the specified project_type' do
        get '/projectTypes/1',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/projectTypes/1'
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'POST /projectTypes' do
    let(:project_type_request) { attributes_for(:project_type) }

    context 'with authorization' do
      it 'creates the specified project_type' do
        post '/projectTypes',
             params: project_type_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
      end
    end

    context 'without authorization' do
      before :each do
        post '/projectTypes',
             params: project_type_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'PUT /projectTypes/:id' do
    before :each do
      FactoryGirl.create :project_type_with_tasks, id: 1
      @project_type_request = {
        name: 'Some Other Name'
      }
    end

    context 'with authorization' do
      it 'updates the specified project_type' do
        @project_type_request = {
          name: 'Some Other Name'
        }

        put '/projectTypes/1',
            params: @project_type_request.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        @project_type_request = {
          name: 'Some Other Name'
        }

        post '/projectTypes',
             params: @project_type_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'DELETE /projectTypes/:id' do
    before :each do
      FactoryGirl.create :project_type, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified project_type' do
        delete '/projectTypes/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/projectTypes/1',
               headers: { 'Content-Type' => 'application/json' }
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'POST /projectTypes/:id/taskItems' do
    before :each do
      FactoryGirl.create :task_item, id: 1
      FactoryGirl.create :task_item, id: 2
      FactoryGirl.create :project_type, id: 1

      @project_type_request = {
        task_item_ids: [1, 2]
      }
    end

    context 'with authorization' do
      it 'adds task_items to the specified project_type' do
        post '/projectTypes/1/taskItems',
             params: @project_type_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 200
        expect(json['task_items'].size).to eq 2
      end

      it 'clears all task items if an empty request is made' do
        project_type_request = { task_item_ids: [] }

        post '/projectTypes/1/taskItems',
             params: project_type_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 200
        expect(json['task_items']).to eq []
      end
    end

    context 'without authorization' do
      before :each do
        post '/projectTypes/1/taskItems',
             params: @project_type_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end
end
