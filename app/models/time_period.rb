class TimePeriod < ApplicationRecord
  has_many :expense_statuses
  has_many :expenses, through: :expense_statuses
end
