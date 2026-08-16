class AddUserToPackingLists < ActiveRecord::Migration[8.1]
  def change
    add_reference :packing_lists, :user, null: false, foreign_key: true
  end
end
