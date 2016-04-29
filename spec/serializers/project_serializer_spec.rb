require 'rails_helper'

describe ProjectSerializer, :type => :serializer do
  context 'a single Project resource' do
    let(:resource) { build(:project) }

    let(:serializer) { ProjectSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject['startDate']).to_not be_nil }

    it { expect(subject).to have_key('completedDate') }
    it { expect(subject).to have_key('dueDate') }
    it { expect(subject).to have_key('client') }
    it { expect(subject).to have_key('project_type') }
    it { expect(subject).to have_key('time_entries') }
  end
end
