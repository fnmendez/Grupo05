class CreateFavoriteSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_series do |t|
      t.references :user, index:true, foreign_key: true
      t.belongs_to :serie, index:true, foreign_key: true
      t.timestamps
    end
  end
end
