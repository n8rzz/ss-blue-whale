require 'rails_helper'

describe 'Sessions', :type => :request do
  describe 'GET /login' do
    context 'with valid information' do
      before :each do
      end
      it 'returns the correct user'
      it 'returns the correct status code'
    end

    context 'with invalid information' do
      before :each do
      end
      it 'does not return a user'
      it 'returns the correct error code'
    end
  end
end
