require 'rails_helper'

describe ClientSerializer, :type => :serializer do
  context 'a single Client resource' do
    let(:resource) { build(:client) }

    let(:serializer) { ClientSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject['name']).to eql(resource.name) }
    it { expect(subject['address_1']).to eql(resource.address_1) }
    it { expect(subject['address_2']).to eql(resource.address_2) }
    it { expect(subject['city']).to eql(resource.city) }
    it { expect(subject['state']).to eql(resource.state) }
    it { expect(subject['zip']).to eql(resource.zip) }
    it { expect(subject['fax']).to eql(resource.fax) }
    it { expect(subject['phone']).to eql(resource.phone) }
    it { expect(subject['email']).to eql(resource.email) }
    it { expect(subject['website']).to eql(resource.website) }
    it { expect(subject['entity']).to eq(resource.entity) }
    it { expect(subject['status']).to eq(resource.status) }
    it { expect(subject).to have_key('joinDate') }
    it { expect(subject).to have_key('projects') }
    it { expect(subject).to have_key('client_contacts') }
    it { expect(subject).to have_key('notes') }
  end
end
