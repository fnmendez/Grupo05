class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.string :country
      t.string :genre
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
