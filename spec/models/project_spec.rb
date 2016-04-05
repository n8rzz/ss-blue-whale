require 'rails_helper'

describe Project, :type => :model do
  it 'has valid factories' do
    expect(build(:project)).to be_instance_of(Project)
  end

  it { should have_db_column(:startDate).of_type(:datetime) }
  it { should have_db_column(:dueDate).of_type(:datetime) }
  it { should have_db_column(:completedDate).of_type(:datetime) }

  it { should belong_to(:client) }
end
