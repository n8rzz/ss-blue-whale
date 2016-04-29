require 'rails_helper'

describe Client, :type => :model do
  it 'has valid factories' do
    expect(build(:client)).to be_instance_of(Client)
  end

  let(:client) { create(:client) }

  describe 'data and associations' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:address_1).of_type(:string) }
    it { should have_db_column(:address_2).of_type(:string) }
    it { should have_db_column(:city).of_type(:string) }
    it { should have_db_column(:state).of_type(:string) }
    it { should have_db_column(:zip).of_type(:string) }
    it { should have_db_column(:fax).of_type(:string) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:website).of_type(:string) }
    it { should have_db_column(:entity).of_type(:string) }
    it { should have_db_column(:joinDate).of_type(:datetime) }
    it { should have_db_column(:status).of_type(:string) }

    it { should have_many(:projects).dependent(:destroy) }
    # it { should have_many(:client_contacts).dependent.destroy }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_uniqueness_of :name }
  end

  describe 'callbacks' do
    it { expect(client).to callback(:set_default_join_date).before(:create) }
    it { expect(client).to callback(:set_default_status).before(:create) }
  end

  describe '#set_default_join_date' do
    it { expect(client.joinDate).to_not eq nil }
  end

  describe '#set_default_status' do
    it { expect(client.status).to eq 'Active' }
  end
end
