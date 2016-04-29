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

    it { expect(time_entry).to callback(:set_duration).after(:save) }
  end

  describe '#set_duration' do
    it 'returns early if endTime is nil' do
      @time_entry = build(:time_entry, endTime: nil, duration: nil)
      @time_entry.set_duration

      expect(@time_entry.duration).to eq nil
    end

    it 'sets duration after_save' do
      @time_entry = build(:time_entry, startTime: 2.hours.ago, endTime: 1.hour.ago, duration: nil)
      @time_entry.save!

      expect(@time_entry.duration).to eq 1
    end

    describe 'when record is updated' do
      before :each do
        @time_entry = build(:time_entry, startTime: 8.hours.ago, endTime: 4.hour.ago, duration: nil)
        @time_entry.save!
      end

      it 'recaluates duration' do
        @time_entry.endTime = 1.hour.ago
        @time_entry.save!

        expect(@time_entry.duration).to_not eq 4
        expect(@time_entry.duration).to eq 7
      end
    end
  end

  # describe 'start_time_is_greater_than_end_time' do
  #
  # end
end
