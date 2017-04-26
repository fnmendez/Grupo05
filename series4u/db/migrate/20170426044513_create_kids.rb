class CreateKids < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.integer :user_id
      t.integer :kiddy_id

      t.timestamps
    end
  end
end
