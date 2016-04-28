require 'rails_helper'

describe 'Registrations', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /users' do
    context 'with authorization' do
      before :each do
        create_list(:user, 2)

        get '/users',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json.size).to eq 3 }
    end

    context 'without authorization' do
      before :each do
        get '/users'
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['status']).to eq 401 }
      it { expect(json).to have_key('error') }
      it { expect(json['error']).to eq 'unauthorized' }
    end
  end

  describe 'POST /users' do
    context 'with authorization' do
      before :each do
        @user = attributes_for(:user)

        post '/users',
             params: @user.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json).to have_key('user_id') }
    end

    context 'without authorization' do
      before :each do
        post '/users'
      end

      it { expect(response.status).to eq 400 }
      it { expect(json).to have_key('email') }
      it { expect(json).to have_key('username') }
    end
  end

  describe 'PUT /users/:id' do
    context 'with authorization' do
      before :each do
        @user = FactoryGirl.create(:user, id: 1, password: '12345678')
        @user_request = {
          username: 'Timmy The Tooth',
          password: '12345678'
        }

        patch '/users/1',
              params: @user_request.to_json,
              headers: {
                'Content-Type' => 'application/json',
                'Authorization' => user.access_token
              }
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['username']).to eq 'Timmy The Tooth' }
    end

    context 'without authorization' do
      before :each do
        @user = FactoryGirl.create(:user, id: 1, password: '12345678')

        patch '/users/1'
      end

      it { expect(response.status).to eq 200 }
      it { expect(json['status']).to eq 401 }
      it { expect(json).to have_key('error') }
      it { expect(json['error']).to eq 'unauthorized' }
    end
  end
end
