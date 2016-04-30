require 'rails_helper'

describe ClientContact, :type => :model do
  it 'has valid factories' do
    expect(build(:client_contact)).to be_instance_of(ClientContact)
  end

  describe 'data and associations' do
    it { should have_db_column(:position).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:businessPhone).of_type(:string) }
    it { should have_db_column(:mobilePhone).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_index(:client_id) }

    it { should belong_to(:client) }
  end

  describe 'validations' do
    let(:client_contact) { create(:client_contact) }

    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(160) }
  end
end
