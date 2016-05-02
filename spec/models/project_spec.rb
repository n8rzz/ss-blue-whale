require 'rails_helper'

describe Project, :type => :model do
  it 'has valid factories' do
    expect(build(:project)).to be_instance_of(Project)
  end

  let(:project) { create(:project) }

  describe 'data and associations' do
    it { should have_db_column(:startDate).of_type(:datetime) }
    it { should have_db_column(:dueDate).of_type(:datetime) }
    it { should have_db_column(:completedDate).of_type(:datetime) }
    it { should have_db_index(:project_type_id) }

    it { should belong_to(:client) }
    it { should belong_to(:project_type) }
    it { should have_many(:time_entries) }
    it { should have_many(:notes).dependent(:destroy) }
  end

  describe 'validations' do
  end

  describe 'callbacks' do
  end
end
