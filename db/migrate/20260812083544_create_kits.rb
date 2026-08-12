class CreateKits < ActiveRecord::Migration[8.1]
  def change
    create_table :kits do |t|
      t.string :name
      t.string :category
      t.string :select_type

      t.timestamps
    end
  end
end
