require 'rails_helper'

describe Client, :type => :model do
  it 'has valid factories' do
    expect(build(:client)).to be_instance_of(Client)
  end

  it { should have_db_column(:name).of_type(:string) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_least(2) }
  it { should validate_uniqueness_of :name }
  it { should have_db_column(:address_1).of_type(:string) }
  it { should have_db_column(:address_2).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:zip).of_type(:string) }
  it { should have_db_column(:fax).of_type(:string) }
  it { should have_db_column(:phone).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:website).of_type(:string) }

  it { should have_many(:projects).dependent(:destroy) }
end
