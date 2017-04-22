class CreateChapterRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_ratings do |t|
      t.integer :stars
      t.references :view, index:true, foreign_key: true

      t.timestamps
    end
  end
end
