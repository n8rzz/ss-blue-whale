require 'rails_helper'

describe TaskItem, type: :model do
  it 'has valid factories' do
    expect(build(:task_item)).to be_instance_of(TaskItem)
  end

  it { should have_db_column(:name).of_type(:string) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
  it { should have_db_column(:description).of_type(:string) }
  it { should validate_length_of(:description).is_at_least(2).is_at_most(160) }

  it { should have_db_column(:startDate).of_type(:datetime) }
  it { should have_db_column(:endDate).of_type(:datetime) }

  it { should have_and_belong_to_many(:project_type) }
end
