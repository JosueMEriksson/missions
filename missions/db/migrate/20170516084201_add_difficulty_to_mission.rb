class AddDifficultyToMission < ActiveRecord::Migration
  def change
    add_column :missions, :difficulty, :integer
  end
end
