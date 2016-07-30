class Client < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :client_contacts,
           -> { order(name: :asc) },
           dependent: :destroy
  has_many :notes,
           -> { order(created_at: :desc) },
           as: :notable,
           dependent: :destroy

  before_create :set_default_join_date, :set_default_status

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :entity, presence: true, inclusion: { in: %w(Individual S-Corp C-Corp Partnership LLC),
                                                  message: "%{value} is not a valid entity" }
  validates :status, inclusion: { in: %w(Active Inactive),
                                  message: "%{value} is not a valid status" }

  private

  def set_default_join_date
    return unless joinDate.blank?
    self.joinDate = Time.now
  end

  def set_default_status
    self.status = 'Active'
  end
end
