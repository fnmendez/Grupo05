class AddTitleToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :title, :string
  end
end
