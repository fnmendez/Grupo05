class CreateSerieActs < ActiveRecord::Migration[5.1]
  def change
    create_table :serie_acts do |t|
      t.references :actor, index:true, foreign_key: true
      t.references :serie, index:true, foreign_key: true

      t.timestamps
    end
  end
end
