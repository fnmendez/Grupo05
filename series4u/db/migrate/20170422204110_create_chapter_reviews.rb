class CreateChapterReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_reviews do |t|
      t.text :content
      t.references :view, index: true, foreign_key: true

      t.timestamps
    end
  end
end
