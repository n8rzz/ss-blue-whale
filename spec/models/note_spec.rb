require 'rails_helper'

describe Note, :type => :model do
  it 'has valid factories' do
    expect(build(:note)).to be_instance_of(Note)
  end

  let(:note) { create(:note) }

  describe 'data and associations' do
    it { should have_db_column(:content).of_type(:text) }
  end

  describe 'validations' do
    it { should validate_presence_of :content }
  end
end
