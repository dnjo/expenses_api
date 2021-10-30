class CreateUserAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_authentications do |t|
      t.belongs_to :user
      t.string :identifier

      t.timestamps
    end
  end
end
