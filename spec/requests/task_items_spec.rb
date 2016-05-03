require 'rails_helper'

describe 'TaskItems', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /taskItems' do
    context 'with authorization' do
      it 'returns all task_items' do
        FactoryGirl.create_list(:task_item, 3)

        get '/taskItems',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
        expect(json.size).to eq 3
      end
    end

    context 'without authorization' do
      before :each do
        get '/taskItems',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'GET /taskItems/:id' do
    before :each do
      FactoryGirl.create :task_item_with_project_types, id: 1
    end

    context 'with authorization' do
      it 'returns the specified project' do
        get '/taskItems/1'

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/taskItems/1',
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

  describe 'POST /taskItems' do
    let(:task_item_request) { attributes_for(:task_item_with_project_types) }

    context 'with authorization' do
      it 'creates the specified task_item' do
        post '/taskItems',
             params: task_item_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
      end
    end

    context 'without authorization' do
      before :each do
        post '/taskItems',
             params: task_item_request.to_json,
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

  describe 'PUT /taskItems/:id' do
    before :each do
      FactoryGirl.create :task_item, id: 100
      FactoryGirl.create :task_item, id: 200
      FactoryGirl.create :task_item, id: 1

      @project_request = {
        name: 'Some Other Name',
        project_type: [100, 200]
      }
    end

    context 'with authorization' do
      it 'updates the specified task_item' do
        put '/taskItems/1',
            params: @project_request.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        post '/taskItems',
             params: @project_request.to_json,
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

  describe 'DELETE /taskItems/:id' do
    before :each do
      FactoryGirl.create :task_item, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified project' do
        delete '/taskItems/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/taskItems/1',
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

  describe 'POST /taskItems/:id/projectTypes' do
    before :each do
      FactoryGirl.create :project_type, id: 1
      FactoryGirl.create :project_type, id: 2
      FactoryGirl.create :task_item, id: 1

      @task_item_request = {
        project_type_ids: [1, 2]
      }
    end

    context 'with authorization' do
      it 'adds project_types to the specified task_item' do
        post '/taskItems/1/projectTypes',
             params: @task_item_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 200
        expect(json['project_types'].size).to eq 2
      end
    end

    context 'without authorization' do
      before :each do
        post '/taskItems/1/projectTypes',
             params: @task_item_request.to_json,
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

    # it 'clears all task items if an empty request is made' do
    #   FactoryGirl.create :project_type, id: 1
    #
    #   post '/projectTypes/1/taskItems',
    #        headers: { 'Content-Type' => 'application/json' }
    #
    #   expect(response.status).to eq 200
    #   body = JSON.parse(response.body)
    #   expect(body['task_items']).to eq nil
    # end
  end

  describe 'POST /taskItems/:id/notes' do
    before :each do
      create :task_item, id: 1
      @note = attributes_for(:note, :notable_task_item, id: 1)
    end

    context 'with authorization' do
      it 'adds note to the specified task_item' do
        post '/taskItems/1/notes',
             params: @note.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
      end
    end

    context 'without authorization' do
      before :each do
        post '/taskItems/1/notes',
             headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'PUT /taskItems/:id/notes/:id' do
    before :each do
      create(:task_item, id: 1)
      create(:note, :notable_task_item, id: 1)
      @note_request = {
        content: 'Something different'
      }
    end

    # FIXME: deprecation warning
    #
    # This block throws a deprecation warning:
    # DEPRECATION WARNING: Passing an argument to force an association to reload is now deprecated and will be removed
    # in Rails 5.1. Please call `reload` on the result collection proxy instead. (called from update at
    # BlueWhale-api/app/controllers/notes_controller.rb:14)
    # context 'with authorization' do
    #   it 'adds note to the specified task_item' do
    #     put '/taskItems/1/notes/1',
    #         params: @note_request.to_json,
    #         headers: {
    #           'Content-Type' => 'application/json',
    #           'Authorization' => user.access_token
    #         }
    #
    #     expect(response.status).to eq 200
    #   end
    # end

    context 'without authorization' do
      before :each do
        put '/taskItems/1/notes/1',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'DELETE /taskItems/:id/notes/:id' do
    context 'with authorization' do
      before :each do
        @task_item = create(:task_item, id: 1)
        @note = create(:note, :notable_task_item, id: 1)

        delete '/taskItems/1/notes/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }
      end

      it { expect(response.status).to eq 204 }
    end

    context 'without authorization' do
      before :each do
        @task_item = create(:task_item, id: 1)
        @task_item.notes.create(content: Faker::Lorem.sentence(1))

        delete '/taskItems/1/notes/1',
               headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end
end
