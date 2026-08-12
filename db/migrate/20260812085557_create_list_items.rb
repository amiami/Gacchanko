class CreateListItems < ActiveRecord::Migration[8.1]
  def change
    create_table :list_items do |t|
      t.references :packing_list, null: false, foreign_key: true
      t.string :item_name
      t.string :source_labels
      t.boolean :is_checked

      t.timestamps
    end
  end
end
