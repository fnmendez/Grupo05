class CreateSerieDirecteds < ActiveRecord::Migration[5.1]
  def change
    create_table :serie_directeds do |t|
      t.references :director, index:true, foreign_key: true
      t.references :serie, index:true, foreign_key: true

      t.timestamps
    end
  end
end
