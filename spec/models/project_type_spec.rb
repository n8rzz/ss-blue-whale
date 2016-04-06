require 'rails_helper'

describe ProjectType, type: :model do
  it 'has valid factories' do
    expect(build(:project_type)).to be_instance_of(ProjectType)
  end

  it { should have_db_column(:name).of_type(:string) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
  it { should have_db_column(:description).of_type(:string) }
  it { should validate_length_of(:description).is_at_least(2).is_at_most(160) }
  it { should have_db_column(:dueDate).of_type(:datetime) }
end
