class AddPictureToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :picture, :string
  end
end
