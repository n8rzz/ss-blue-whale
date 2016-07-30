require 'rails_helper'

describe TaskItem, type: :model do
  it 'has valid factories' do
    expect(build(:task_item)).to be_instance_of(TaskItem)
    expect(build(:task_item_with_project_types)).to be_instance_of(TaskItem)
  end

  describe 'data and associations' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:sortOrder).of_type(:integer) }
    it { should have_db_column(:startDate).of_type(:datetime) }
    it { should have_db_column(:endDate).of_type(:datetime) }
    it { should have_db_column(:isControllable).of_type(:boolean).with_options(null: false, default: true) }
    it { should have_db_index(:project_type_id) }

    it { should have_many(:project_types).through(:project_types_task_items) }
    it { should have_many(:time_entries) }
    it { should have_many(:notes).dependent(:destroy) }
    it { should accept_nested_attributes_for(:project_types) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_length_of(:description).is_at_least(2).is_at_most(160) }
    it { should validate_presence_of(:sortOrder) }
    it { should validate_presence_of(:isControllable) }
  end

  describe 'callbacks' do
  end
end
