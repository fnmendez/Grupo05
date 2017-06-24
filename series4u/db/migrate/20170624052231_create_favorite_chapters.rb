class CreateFavoriteChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_chapters do |t|
      t.references :user, index:true, foreign_key: true
      t.belongs_to :chapter, index:true, foreign_key: true
      t.timestamps
    end
  end
end
