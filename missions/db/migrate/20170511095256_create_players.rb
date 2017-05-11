class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :money, default: 0, nil: false

      t.timestamps
    end

    add_column :agents, :player_id, :integer
    add_index :agents, :player_id
  end

  def up
  	player = Player.create(name: 'Ezio Auditore')
  	Agent.update_all(player_id: player.id)
  end


end
