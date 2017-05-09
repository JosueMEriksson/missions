class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :ability
      t.integer :level
      t.boolean :on_mission

      t.timestamps
    end
  end
end
