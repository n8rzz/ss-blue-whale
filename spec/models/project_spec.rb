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
    it { should have_db_column(:leadTimeDays).of_type(:integer) }
    it { should have_db_column(:isRecurring).of_type(:boolean).with_options(null: false, default: false) }
    it { should have_db_column(:status).of_type(:string) }
    it { should have_db_index(:project_type_id) }

    it { should belong_to(:client) }
    it { should belong_to(:project_type) }
    it { should have_many(:time_entries) }
    it { should have_many(:notes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:startDate) }
    it { should validate_inclusion_of(:status).in_array(%w(Scheduled Active Closed Complete)) }
  end

  # describe 'callbacks' do
  # end
end
