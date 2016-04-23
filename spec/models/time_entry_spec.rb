require 'rails_helper'

describe TimeEntry, :type => :model do
  it 'has valid factories' do
    expect(build(:time_entry)).to be_instance_of(TimeEntry)
  end

  it { should have_db_column(:startTime).of_type(:datetime) }
  it { should validate_presence_of(:startTime) }
  it { should have_db_column(:endTime).of_type(:datetime) }
  it { should have_db_column(:duration).of_type(:integer) }

  # it { should have_many(:projects).dependent(:destroy) }
end
