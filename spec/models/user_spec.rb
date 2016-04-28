require 'rails_helper'

describe User, :type => :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_instance_of(User)
    expect(build(:session_request)).to be_instance_of(User)
  end

  describe 'data and associations' do
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:access_token).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:last_sign_in_at) }

    it { should have_many(:time_entries) }
  end

  describe 'validations' do
    before { expect(create(:user)).to be_instance_of(User) }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:username).is_at_least(2) }
    it { should validate_uniqueness_of(:access_token) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'callbacks' do
    let(:user) { create(:user) }

    it { expect(user).to callback(:update_access_token!).after(:create) }
  end

  # describe 'instance methods' do
  #   before { create(:user, first_name: 'Tom', last_name: 'Tomkins') }
  #
  #   it 'should render a full user name' do
  #     expect { (user.name).to eq('Tom Tomkins') }
  #   end
  # end
end
