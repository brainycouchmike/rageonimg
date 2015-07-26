class CreateNewImageFields1 < ActiveRecord::Migration
  def change
    add_column :images, :title, :string
    add_column :images, :date, :datetime
  end
end
