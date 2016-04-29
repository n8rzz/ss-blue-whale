require 'rails_helper'

describe TimeEntrySerializer, :type => :serializer do
  context 'a single TimeEntry resource' do
    let(:resource) { build(:time_entry, startTime: 2.hours.ago, endTime: 1.hour.ago) }

    let(:serializer) { TimeEntrySerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject).to have_key('startTime') }
    it { expect(subject).to have_key('endTime') }
    it { expect(subject).to have_key('duration') }
    it { expect(subject).to have_key('task_item') }
    it { expect(subject).to have_key('project') }
  end
end
