class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.date :release_date
      t.belongs_to :serie, index: true
      t.timestamps
    end
  end
end
