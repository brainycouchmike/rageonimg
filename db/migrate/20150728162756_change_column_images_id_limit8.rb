class ChangeColumnImagesIdLimit8 < ActiveRecord::Migration
  def change
    change_column :images, :id, :integer, limit: 8, primary_key: true
  end
end
