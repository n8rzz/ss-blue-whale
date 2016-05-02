require 'rails_helper'

describe 'Projects', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /projects' do
    before :each do
      FactoryGirl.create_list(:project, 3)
    end

    context 'with authorization' do
      it 'returns all projects' do
        get '/projects',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/projects',
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

  describe 'GET /projects/:id' do
    before :each do
      FactoryGirl.create :project, id: 1
    end

    context 'with authorization' do
      it 'returns the specified project' do
        get '/projects/1',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/projects/1',
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

  describe 'POST /projects' do
    before :each do
      FactoryGirl.create(:client, id: 1)
      FactoryGirl.create(:project_type, id: 1)

      @project_request = attributes_for(:project, client_id: 1, project_type_id: 1)
    end

    context 'with authorization' do
      it 'creates the specified project' do
        post '/projects',
             params: @project_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
      end
    end

    context 'without authorization' do
      before :each do
        post '/projects',
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

  describe 'PUT /projects/:id' do
    before :each do
      FactoryGirl.create :project, id: 1

      @project_request = {
        id: 1,
        startDate: 2.days.ago
      }
    end

    context 'with authorization' do
      it 'updates the specified project' do
        put '/projects/1',
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
        put '/projects/1',
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

  describe 'DELETE /projects/:id' do
    before :each do
      FactoryGirl.create :project, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified project' do
        delete '/projects/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/projects/1',
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

  describe 'POST /projects/:id/notes' do
    before :each do
      create :project, id: 1
      @note = attributes_for(:note, :notable_project, id: 1)
    end

    context 'with authorization' do
      it 'adds note to the specified project' do
        post '/projects/1/notes',
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
        post '/projects/1/notes',
             headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  # FIXME: deprecation warning
  #
  # This block throws a deprecation warning:
  # DEPRECATION WARNING: Passing an argument to force an association to reload is now deprecated and will be removed
  # in Rails 5.1. Please call `reload` on the result collection proxy instead. (called from update at
  # BlueWhale-api/app/controllers/notes_controller.rb:14)
  describe 'PUT /projects/:id/notes/:id' do
    before :each do
      create(:project, id: 1)
      create(:note, :notable_project, id: 1)
      @note_request = {
        content: 'Something different'
      }
    end

    context 'with authorization' do
      it 'adds note to the specified project' do
        put '/projects/1/notes/1',
            params: @note_request.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        put '/projects/1/notes/1',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'DELETE /projects/:id/notes/:id' do
    context 'with authorization' do
      before :each do
        create(:project, id: 1)
        @note = create(:note, :notable_project, id: 1)

        delete '/projects/1/notes/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }
      end

      it { expect(response.status).to eq 204 }
    end

    context 'without authorization' do
      before :each do
        create(:client, id: 1)
        @note = create(:note, :notable_project, id: 1)

        delete '/projects/1/notes/1',
               headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end
end
