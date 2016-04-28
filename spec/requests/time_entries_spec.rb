require 'rails_helper'

describe 'TimeEntries', :type => :request do
  let(:user) { create(:user) }

  describe 'GET /timeEntries' do
    before :each do
      create_list(:time_entry, 3)
    end

    context 'with authorization' do
      it 'returns all time_entries' do
        get '/timeEntries',
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
        get '/timeEntries',
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

  describe 'GET /timeEntries/:id' do
    before :each do
      @time_entry = FactoryGirl.create :time_entry, id: 1
    end

    context 'with authorization' do
      it 'returns the specified time_entry' do
        get '/timeEntries/1',
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
        expect(json['startTime']) == @time_entry['startTime']
      end
    end

    context 'without authorization' do
      before :each do
        get '/timeEntries/1',
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

  describe 'POST /timeEntries' do
    before :each do
      @task_item = create(:task_item)
      @time_entry_request = attributes_for(:time_entry, task_item_id: @task_item.id, user_id: user.id)
    end

    context 'with authorization' do
      it 'creates the specified time_entry' do
        post '/timeEntries',
             params: @time_entry_request.to_json,
             headers: {
               'Content-Type' => 'application/json',
               'Authorization' => user.access_token
             }

        expect(response.status).to eq 201
        expect(json['startTime']) == @time_entry_request['startTime']
      end
    end

    context 'without authorization' do
      before :each do
        post '/timeEntries',
             params: @time_entry_request.to_json,
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

  describe 'PUT /timeEntries/:id' do
    before :each do
      FactoryGirl.create :time_entry, id: 1, endTime: nil

      @time_entry_request = {
        endTime: Time.now
      }
    end

    context 'with authorization' do
      it 'updates the specified time_entry' do
        put '/timeEntries/1',
            params: @time_entry_request.to_json,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => user.access_token
            }

        expect(response.status).to eq 200
        expect(json['endTime']) == @time_entry_request['endTime']
      end
    end

    context 'without authorization' do
      before :each do
        put '/timeEntries/1',
            params: @time_entry_request.to_json,
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

  describe 'DELETE /timeEntries/:id' do
    before :each do
      FactoryGirl.create :time_entry, id: 1
    end

    context 'with authorization' do
      it 'deletes the specified time_entry' do
        delete '/timeEntries/1',
               headers: {
                 'Content-Type' => 'application/json',
                 'Authorization' => user.access_token
               }

        expect(response.status).to eq 204
      end
    end

    context 'without authorization' do
      before :each do
        delete '/timeEntries/1',
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
