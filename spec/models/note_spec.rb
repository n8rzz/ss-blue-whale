require 'rails_helper'

describe Note, :type => :model do
  it 'has valid factories' do
    expect(build(:note)).to be_instance_of(Note)
  end

  let(:note) { create(:note) }

  describe 'data and associations' do
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:notable_id).of_type(:integer) }
    it { should have_db_column(:notable_type).of_type(:string) }
    # it { should have_db_index(:notable_id) }
    # it { should have_db_index(:notable_type) }

    it { should belong_to(:notable) }
  end

  describe 'validations' do
    it { should validate_presence_of :content }
  end
end
