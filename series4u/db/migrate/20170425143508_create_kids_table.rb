class CreateKidsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :kids, id: false do |t|
      t.integer :user_id
      t.integer :kid_user_id
    end

    add_index :kids, [:user_id, :kid_user_id], :unique => true
    add_index :kids, [:kid_user_id, :user_id], :unique => true
  end
end
