class TimePeriod < ApplicationRecord
  has_many :expense_statuses, dependent: :delete_all
  belongs_to :user
end
