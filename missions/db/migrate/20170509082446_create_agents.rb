class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :kind
      t.integer :level, default: 1
      t.boolean :free, default: true
      
      t.timestamps
    end
  end
end
