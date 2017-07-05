class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null:false
      t.integer :user_id, null:false
      t.text :steps
      t.boolean :private?, null:false, default:true
      t.boolean :completed?, null:false, default:false
      t.timestamps null: false
    end
    add_index :goals, :user_id
    add_index :goals, [:user_id, :title], unique:true
  end
end
