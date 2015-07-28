class CreateShopifies < ActiveRecord::Migration
  def change
    create_table :shopifies do |t|

      t.timestamps null: false
    end
  end
end
