class User < ApplicationRecord
  has_many :user_authentications
  has_many :time_periods
  has_many :expense_statuses, through: :time_periods
  has_many :expenses

  def self.create_from_subject(subject)
    authentication = UserAuthentication.find_or_create_by(identifier: subject)
    return authentication.user if authentication.user

    authentication.user = User.create
    authentication.save
    authentication.user
  end
end
