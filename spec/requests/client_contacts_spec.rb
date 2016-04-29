require 'rails_helper'
require 'securerandom'

describe 'ClientContacts', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /clientContacts' do
    before :each do
      FactoryGirl.create :client_contact, name: 'John Doe'
    end

    context 'with authorization' do
      it 'returns all clients' do
        get '/clientContacts',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
      end
    end

    context 'without authorization' do
      before :each do
        get '/clientContacts',
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

  describe 'GET /clientContacts/:id' do
    before :each do
      uuid = SecureRandom.uuid
      @client_id_url = "/clientContacts/#{uuid}"
      FactoryGirl.create :client_contact, id: uuid, name: 'Paint it All, Inc.'
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

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'POST /clientContacts' do
    before :each do
      @client_request = attributes_for(:client_contact)
    end

    context 'with authorization' do
      it 'creates the specified client' do
        post '/clientContacts',
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
        post '/clientContacts',
             params: @client_request.to_json,
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

  describe 'PUT /clientContacts/:id' do
    before :each do
      uuid = SecureRandom.uuid
      @client_id_url = "/clientContacts/#{uuid}"
      FactoryGirl.create :client_contact, id: uuid, name: 'Paint it All, Inc.'

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

      it 'request succeeds' do
        expect(response.status).to eq 200
      end

      it 'response contains error metadata' do
        expect(json['error']).to eq 'unauthorized'
        expect(json['status']).to eq 401
      end
    end
  end

  describe 'DELETE /clientContacts/:id' do
    before :each do
      uuid = SecureRandom.uuid
      @client_id_url = "/clientContacts/#{uuid}"
      FactoryGirl.create :client_contact, id: uuid
    end

    context 'with authorization' do
      it 'deletes the specified client' do
        delete @client_id_url,
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete @client_id_url,
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
