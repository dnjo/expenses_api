class CreateExpenseStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_statuses do |t|
      t.belongs_to :expense
      t.belongs_to :time_period
      t.integer :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
