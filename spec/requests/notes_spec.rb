require 'rails_helper'

describe 'Notes', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /notes' do
    before :each do
      create_list(:note, 3)
    end

    context 'with authorization' do
      it 'returns all notes' do
        get '/notes',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/notes',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'GET /notes/:id' do
    before :each do
      create :note, id: 1
    end

    context 'with authorization' do
      it 'returns the specified project' do
        get '/notes/1',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/notes/1',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'POST /notes' do
    before :each do
      @note_request = attributes_for(:note)
    end

    context 'with authorization' do
      it 'creates the specified project' do
        post '/notes',
             params: @note_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
      end
    end

    context 'without authorization' do
      before :each do
        post '/notes',
             params: @note_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'PUT /notes/:id' do
    before :each do
      create :note, id: 1

      @note_request = {
        content: 'Words, words, words'
      }
    end

    context 'with authorization' do
      it 'updates the specified project' do
        put '/notes/1',
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
        put '/notes/1',
            params: @note_request.to_json,
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'DELETE /notes/:id' do
    before :each do
      create :note, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified project' do
        delete '/notes/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/notes/1',
               headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end
end
