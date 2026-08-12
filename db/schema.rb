# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_12_085557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "kit_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "item_name"
    t.bigint "kit_id", null: false
    t.datetime "updated_at", null: false
    t.index ["kit_id"], name: "index_kit_items_on_kit_id"
  end

  create_table "kits", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "select_type"
    t.datetime "updated_at", null: false
  end

  create_table "list_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_checked"
    t.string "item_name"
    t.bigint "packing_list_id", null: false
    t.string "source_labels"
    t.datetime "updated_at", null: false
    t.index ["packing_list_id"], name: "index_list_items_on_packing_list_id"
  end

  create_table "packing_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "event_date"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kit_items", "kits"
  add_foreign_key "list_items", "packing_lists"
end
