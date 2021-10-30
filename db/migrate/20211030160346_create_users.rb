class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, &:timestamps

    add_reference :time_periods, :user, index: true, foreign_key: true
    add_reference :expenses, :user, index: true, foreign_key: true
  end
end
