require 'rails_helper'

describe 'Registrations', :type => :request do
  describe 'GET /users' do
    context 'with valid information' do
      before :each do
        @user = attributes_for(:user)

        post '/users',
             params: @user.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'has the correct status code' do
        expect(response.status).to eq 200
      end

      it 'creates a new user' do
        expect(json).to have_key('user_id')
      end
    end

    context 'with invalid information' do
      before :each do
        @user = attributes_for(:user, email: '', username: '')

        post '/users',
             params: @user.to_json,
             headers: { 'Content-Type' => 'application/json' }
      end

      it 'returns the correct status code' do
        expect(response.status).to eq 400
      end

      it 'returns errors for invalid fields' do
        expect(json).to have_key('email')
        expect(json).to have_key('username')
      end
    end
  end
end
