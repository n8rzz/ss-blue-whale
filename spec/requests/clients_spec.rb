require 'rails_helper'

describe 'Clients', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /clients' do
    before :each do
      create :client, name: 'John Doe'
    end

    context 'with authorization' do
      it 'returns all clients' do
        get '/clients',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/clients',
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'GET /clients/:id' do
    before :each do
      @client_id_url = "/clients/1"
      create :client, id: 1, name: 'Paint it All, Inc.'
    end

    context 'with authorization' do
      it 'returns the specified client' do
        get @client_id_url,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
        expect(json['name']) == 'Paint it All, Inc.'
      end
    end

    context 'without authorization' do
      before :each do
        get @client_id_url,
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'POST /clients' do
    before :each do
      @client_request = attributes_for(:client)
    end

    context 'with authorization' do
      it 'creates the specified client' do
        post '/clients',
             params: @client_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
        expect(json['name']) == @client_request['name']
      end
    end

    context 'without authorization' do
      before :each do
        post '/clients',
             params: @client_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'PUT /clients/:id' do
    before :each do
      uuid = SecureRandom.uuid
      @client_id_url = "/clients/#{uuid}"
      create :client, id: uuid, name: 'Paint it All, Inc.'

      @client_request = {
        id: uuid.to_s,
        name: 'Ship it'
      }
    end

    context 'with authorization' do
      it 'updates the specified client' do
        put @client_id_url,
            params: @client_request.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
        expect(json['name']) == @client_request['name']
      end
    end

    context 'without authorization' do
      before :each do
        put @client_id_url,
            params: @client_request.to_json,
            headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'DELETE /clients/:id' do
    before :each do
      create :client, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified client' do
        delete '/clients/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/clients/1',
               headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  describe 'POST /clients/:id/notes' do
    before :each do
      create :client, id: 1
      @note = attributes_for :note_content
    end

    context 'with authorization' do
      it 'adds note to the specified client' do
        post '/clients/1/notes',
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
        post '/clients/1/notes',
             headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['error']).to eq 'unauthorized' }
      it { expect(json['status']).to eq 401 }
    end
  end

  # describe 'DELETE /clients/:id/notes/:id' do
  #   before :each do
  #     @note = create(:note, id: 1)
  #     create(:client, id: 1, notes: @note)
  #
  #     delete '/clients/1/notes/1',
  #            headers: {
  #              'Content-Type' => 'application/json',
  #              'Authorization' => user.access_token
  #            }
  #   end
  #
  #   context 'with authorization' do
  #     it { expect(response.status).to eq 200 }
  #   end
  #
  #   context 'without authorization' do
  #     it { expect(response.status).to eq 200 }
  #     it { expect(json['error']).to eq 'unauthorized' }
  #     it { expect(json['status']).to eq 401 }
  #   end
  # end
end
