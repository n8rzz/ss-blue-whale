require 'rails_helper'

describe TaskItemSerializer, :type => :serializer do
  context 'a single TaskItem resource' do
    let(:resource) { build(:task_item) }

    let(:serializer) { TaskItemSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject['id']).to eql(resource.id) }
    it { expect(subject['name']).to eql(resource.name) }
    it { expect(subject['description']).to eql(resource.description) }
    it { expect(subject['sortOrder']).to eql(resource.sortOrder) }
    it { expect(subject).to have_key('startDate') }
    it { expect(subject).to have_key('endDate') }
    it { expect(subject).to have_key('project_types') }
  end
end
