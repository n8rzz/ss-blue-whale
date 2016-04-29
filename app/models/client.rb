class Client < ApplicationRecord
  has_many :projects, dependent: :destroy

  before_create :set_default_join_date

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  def set_default_join_date
    return unless joinDate.blank?
    self.joinDate = Time.now
  end
end
