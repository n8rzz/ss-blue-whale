require 'rails_helper'

describe 'Sessions', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /login' do
    context 'with valid information' do
      before :each do
        session_request = {
          email: user.email,
          password: user.password
        }

        post '/login',
             params: session_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'returns the correct status code' do
        expect(response.status).to eq 200
      end

      it 'returns the correct user' do
        expect(json['access_token']).to eq user.access_token
      end
    end

    context 'with invalid information' do
      before :each do
        session_request = {}

        post '/login',
             params: session_request.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'returns the correct error code' do
        expect(response.status).to eq 401
      end

      it 'returns the error' do
        expect(json['error']).to eq 'sessions_controller.invalid_login_attempt'
      end
    end
  end
end
