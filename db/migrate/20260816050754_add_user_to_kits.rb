class AddUserToKits < ActiveRecord::Migration[8.1]
  def change
    add_reference :kits, :user, null: false, foreign_key: true
  end
end
