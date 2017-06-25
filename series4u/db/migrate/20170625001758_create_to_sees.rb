class CreateToSees < ActiveRecord::Migration[5.1]
  def change
    create_table :to_sees do |t|
      t.datetime :start_time
      t.references :user, index:true, foreign_key: true
      t.belongs_to :chapter, index:true, foreign_key: true
      t.timestamps
    end
  end
end
