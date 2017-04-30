class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.text :summary
      t.references :user, index:true, foreign_key: true
      t.belongs_to :season, index:true, foreign_key: true
      t.timestamps
    end
  end
end
