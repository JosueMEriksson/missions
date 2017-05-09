class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :status
      t.integer :reward
      t.string :agent

      t.timestamps
    end
  end
end
