class Project < ApplicationRecord
  has_many :time_entries
  has_many :notes, as: :notable, dependent: :destroy
  belongs_to :client
  belongs_to :project_type

  validates :startDate, presence: true
  validates :isRecurring, inclusion: { in: [true, false] }
  validates :status, inclusion: { in: %w(Scheduled Active Closed Complete),
                                  message: "%{value} is not a valid status" }
end
