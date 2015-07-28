class AddPrimaryKeyToImages < ActiveRecord::Migration
  def change
    change_column :images, :id, :integer, primary_key: true
  end
end
