class Info < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :message
      t.datetime :created_at
      t.references :player
    end

    add_index :infos, :player_id
  end
end
