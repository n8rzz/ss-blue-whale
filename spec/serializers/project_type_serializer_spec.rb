require 'rails_helper'

describe ProjectTypeSerializer, :type => :serializer do
  context 'a single ProjectType resource' do
    let(:resource) { build(:project_type) }

    let(:serializer) { ProjectTypeSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject['name']).to eql(resource.name) }
    it { expect(subject['description']).to eql(resource.description) }
    it { expect(subject['repeatWhenComplete']).to eql(resource.repeatWhenComplete) }
    it { expect(subject).to have_key('nextRecurringDate') }
    it { expect(subject).to have_key('recurringSchedule') }
    it { expect(subject).to have_key('dueDate') }
    it { expect(subject).to have_key('task_items') }
  end
end
