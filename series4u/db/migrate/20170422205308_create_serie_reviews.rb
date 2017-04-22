class CreateSerieReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :serie_reviews do |t|
      t.text :content
      t.references :user, index:true, foreign_key: true
      t.references :serie, index:true, foreign_key: true

      t.timestamps
    end
  end
end
