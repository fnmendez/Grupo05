class CreateChapterActs < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_acts do |t|
      t.references :actor, index:true, foreign_key: true
      t.references :chapter, index:true, foreign_key: true

      t.timestamps
    end
  end
end
