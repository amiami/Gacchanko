class CreatePackingLists < ActiveRecord::Migration[8.1]
  def change
    create_table :packing_lists do |t|
      t.string :name
      t.date :event_date

      t.timestamps
    end
  end
end
