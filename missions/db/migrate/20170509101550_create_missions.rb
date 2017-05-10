class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :specialty
      t.integer :status, default: 0
      t.integer :reward
      
      t.references :agent

      t.timestamps
    end

    add_index :missions, :specialty
    add_index :missions, :status
  end
end
