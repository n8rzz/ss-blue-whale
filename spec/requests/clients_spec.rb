require 'rails_helper'
require 'securerandom'

describe 'Clients', :type => :request do
  describe 'GET /clients' do
    it 'returns all clients' do
      FactoryGirl.create :client, name: 'John Doe'
      FactoryGirl.create :client, name: 'Jane Doe'

      get '/clients'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      client_names = body.map { |client| client['name'] }
      expect(client_names).to match_array(['John Doe', 'Jane Doe'])
    end
  end

  describe 'POST /clients' do
    it 'creates the specified client' do
      client_request = attributes_for(:client)

      post '/clients',
           params: client_request.to_json,
           headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      client_name = body['name']
      expect(client_name) == client_request['name']
    end
  end

  describe 'PUT /clients/:id' do
    it 'updates the specified client' do
      uuid = SecureRandom.uuid
      client_id_url = "/clients/#{uuid}"
      FactoryGirl.create :client, id: uuid, name: 'Paint it All, Inc.'

      client_request = {
        id: uuid.to_s,
        title: 'Ship it'
      }

      put client_id_url,
          params: client_request.to_json,
          headers: { 'Content-Type' => 'application/json' }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      client_name = body['name']
      expect(client_name) == client_request['name']
    end
  end

  describe 'DELETE /clients/:id' do
    it 'deletes the specified client' do
      uuid = SecureRandom.uuid
      client_id_url = "/clients/#{uuid}"
      FactoryGirl.create :client, id: uuid

      delete client_id_url

      expect(response.status).to eq 204
    end
  end
end
