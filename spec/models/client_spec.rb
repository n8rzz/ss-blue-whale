require 'rails_helper'

describe Client, :type => :model do
  it 'has valid factories' do
    expect(build(:client)).to be_instance_of(Client)
  end

  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_least(2) }
  it { should validate_uniqueness_of :name }
  it { should respond_to :address_1 }
  it { should respond_to :address_2 }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zip }
  it { should respond_to :fax }
  it { should respond_to :phone }
  it { should respond_to :email }
  it { should respond_to :website }
end
