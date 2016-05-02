require 'rails_helper'

describe Projects::ProjectPreviewSerializer, :type => :serializer do
  context 'Project list' do
    let(:resource) { build(:project) }

    let(:serializer) { Projects::ProjectPreviewSerializer.new(resource) }
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
    it { expect(subject).to_not have_key('time_entries') }
    it { expect(subject).to_not have_key('notes') }
  end
end
