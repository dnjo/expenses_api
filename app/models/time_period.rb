class TimePeriod < ApplicationRecord
  has_many :expense_statuses
  belongs_to :user
end
