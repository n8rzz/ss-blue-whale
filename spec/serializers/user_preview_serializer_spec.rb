require 'rails_helper'

describe UserPreviewSerializer, :type => :serializer do
  context 'a User list' do
    let(:resource) { create(:user) }

    let(:serializer) { UserPreviewSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject.size).to eq 3 }
    it { expect(subject['user_id']).to eql(resource.id) }
    it { expect(subject['email']).to eql(resource.email) }
    it { expect(subject['username']).to eql(resource.username) }
  end
end
