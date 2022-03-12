class TimePeriod < ApplicationRecord
  has_many :expense_statuses, dependent: :delete_all
  belongs_to :user

  def create_from(year:, month:)
    new_period = TimePeriod.create(year: year, month: month, user: self.user)
    new_period.expense_statuses << expense_statuses.map do |status|
      new_status = status.dup
      new_status.paid = false
      new_status.save!
      new_status
    end

    new_period.save!
    new_period
  end
end
