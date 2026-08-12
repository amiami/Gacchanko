class CreateKitItems < ActiveRecord::Migration[8.1]
  def change
    create_table :kit_items do |t|
      t.references :kit, null: false, foreign_key: true
      t.string :item_name

      t.timestamps
    end
  end
end
