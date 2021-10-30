class CreateTimePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :time_periods do |t|
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
