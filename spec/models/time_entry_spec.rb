require 'rails_helper'

describe TimeEntry, :type => :model do
  it 'has valid factories' do
    expect(build(:time_entry)).to be_instance_of(TimeEntry)
  end

  describe 'data and associations' do
    it { should have_db_column(:startTime).of_type(:datetime) }
    it { should have_db_column(:endTime).of_type(:datetime) }
    it { should have_db_column(:duration).of_type(:integer) }
    it { should have_db_index(:task_item_id) }
    it { should have_db_index(:project_id) }

    it { should belong_to(:user) }
    it { should belong_to(:task_item) }
    it { should belong_to(:project) }
  end

  describe 'validations' do
    # let(:time_entry) { create(:time_entry) }

    it { should validate_presence_of(:startTime) }
  end

  describe 'callbacks' do
    let(:time_entry) { create(:time_entry) }

    it { expect(time_entry).to callback(:set_duration).before(:save) }
  end

  describe '#set_duration' do
    it 'returns early if endTime and duration are nil' do
      @time_entry = build(:time_entry, endTime: nil, duration: nil)
      @time_entry.set_duration

      expect(@time_entry.duration).to eq nil
    end

    it 'sets duration' do
      @time_entry = build(:time_entry, startTime: 2.hours.ago, endTime: 1.hour.ago, duration: nil)
      @time_entry.set_duration

      expect(@time_entry.duration).to eq 1
    end

    # it 'updates duration if duration is modified' do
    #   duration = TimeDifference.between(2.hours.ago, 1.hour.ago).in_hours
    #   @time_entry = create(:time_entry,
    #                      startTime: 2.hours.ago,
    #                      endTime: 1.hour.ago,
    #                      duration: duration)
    #
    #   @time_entry.set_duration
    #   @time_entry.update_attributes(endTime: 30.minutes.ago)
    #
    #   expect(@time_entry.duration).not_to eq duration
    # end
  end
end
