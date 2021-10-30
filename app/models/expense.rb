class Expense < ApplicationRecord
  has_many :expense_statuses
  has_many :time_periods, through: :expense_statuses
end
