class CreateChapterDirecteds < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_directeds do |t|
      t.references :director, index:true, foreign_key: true
      t.references :chapter, index:true, foreign_key: true

      t.timestamps
    end
  end
end
