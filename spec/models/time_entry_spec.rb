require 'rails_helper'

describe TimeEntry, :type => :model do
  it 'has valid factories' do
    expect(build(:time_entry)).to be_instance_of(TimeEntry)
  end

  describe 'data and associations' do
    it { should have_db_column(:startTime).of_type(:datetime) }
    it { should have_db_column(:endTime).of_type(:datetime) }
    it { should have_db_column(:duration).of_type(:integer) }

    it { should belong_to(:user) }
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
      time_entry = build(:time_entry, endTime: nil, duration: nil)
      time_entry.set_duration

      expect(time_entry.duration).to eq nil
    end

    it 'doesn\'t modify duration if duration is already present' do
      duration = TimeDifference.between(1.hour.ago, Time.now).in_hours
      time_entry = build(:time_entry,
                         startTime: 1.hour.ago,
                         endTime: Time.now,
                         duration: duration)

      time_entry.set_duration

      expect(time_entry.duration).to eq duration
    end

    it 'sets duration' do
      time_entry = build(:time_entry, startTime: 2.hours.ago, endTime: 1.hour.ago, duration: nil)
      time_entry.set_duration

      expect(time_entry.duration).to eq 1
    end
  end
end
