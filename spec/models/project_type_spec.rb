require 'rails_helper'

describe ProjectType, type: :model do
  it 'has valid factories' do
    expect(build(:project_type)).to be_instance_of(ProjectType)
    expect(build(:project_type_with_tasks)).to be_instance_of(ProjectType)
  end

  describe 'data and associations' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:dueDate).of_type(:datetime) }
    it { should have_db_column(:repeatWhenComplete).of_type(:boolean).with_options(null: false, default: false) }
    it { should have_db_column(:recurringSchedule).of_type(:string) }
    it { should have_db_column(:nextRecurringDate).of_type(:datetime) }

    it { should have_many(:projects) }
    it { should have_many(:task_items).through(:project_types_task_items) }
    it { should accept_nested_attributes_for(:task_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_length_of(:description).is_at_least(2).is_at_most(160) }
    it { should validate_inclusion_of(:recurringSchedule).in_array(%w(Weekly Monthly Quarterly Bi-Aunnally Yearly)) }
  end

  # describe 'callbacks' do
  # end
end
