class AddRankToScraps < ActiveRecord::Migration
  def change
    add_column :scraps, :rank, :float,
    default: 0
  end
end
