class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.belongs_to :user, index:true, foreign_key:true
      t.belongs_to :chapter, index:true, foreign_key:true
      t.timestamps
    end
  end
end
