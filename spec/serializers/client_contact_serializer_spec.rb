require 'rails_helper'

describe ClientContactSerializer, :type => :serializer do
  context 'a single ClientContact resource' do
    let(:resource) { build(:client_contact) }

    let(:serializer) { ClientContactSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject['position']).to eql(resource.position) }
    it { expect(subject['name']).to eql(resource.name) }
    it { expect(subject['businessPhone']).to eql(resource.businessPhone) }
    it { expect(subject['mobilePhone']).to eql(resource.mobilePhone) }
    it { expect(subject['email']).to eql(resource.email) }
    it { expect(subject['client_id']).to eql(resource.client_id) }
  end
end
