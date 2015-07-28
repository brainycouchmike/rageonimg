class CreateTables < ActiveRecord::Migration
  def change
    create_table "action_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", id: false, force: :cascade do |t|
    t.integer  "id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position"
    t.text     "variant_ids"
    t.string   "src"
    t.string   "path"
    t.datetime "lastmod",     null: false
  end
  end
end
