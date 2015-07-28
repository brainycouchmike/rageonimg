class Create < ActiveRecord::Migration
  def change
    create_table "action_links", force: :cascade do |t|
      t.string   "url",         default: "#",          null: false
      t.text     "params",      default: "",           null: false
      t.string   "anchor_text", default: "Click Here", null: false
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
    end

    create_table "images", primary_key: :id, id: false, force: :cascade do |t|
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
