class CreateSidenav < ActiveRecord::Migration
  def change
    create_table :sidenavs do |t|
      t.string "href", null: false, default: "#"
      t.string "params"
      t.string "anchor_text", null: false, default: "click here"
    end
  end
end
