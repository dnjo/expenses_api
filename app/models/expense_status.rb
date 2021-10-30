class ExpenseStatus < ApplicationRecord
  belongs_to :expense
  belongs_to :time_period
end
