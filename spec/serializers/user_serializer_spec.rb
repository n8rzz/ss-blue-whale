require 'rails_helper'

describe UserSerializer, :type => :serializer do
  context 'a single User resource' do
    let(:resource) { build(:user) }

    let(:serializer) { UserSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['user_id']).to eql(resource.id) }
    it { expect(subject['email']).to eql(resource.email) }
    it { expect(subject['username']).to eql(resource.username) }
    it { expect(subject['access_token']).to eql(resource.access_token) }
    it { expect(subject['token_type']).to eql('Bearer') }
  end
end
