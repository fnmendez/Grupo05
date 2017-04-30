class CreateSerieRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :serie_ratings do |t|
      t.integer :stars
      t.references :user, index:true, foreign_key: true
      t.references :serie, index:true, foreign_key: true

      t.timestamps
    end
  end
end
