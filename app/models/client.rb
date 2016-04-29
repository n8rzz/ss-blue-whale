class Client < ApplicationRecord
  has_many :projects, dependent: :destroy

  before_create :set_default_join_date, :set_default_status

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  private

  def set_default_join_date
    return unless joinDate.blank?
    self.joinDate = Time.now
  end

  def set_default_status
    self.status = 'Active'
  end
end
