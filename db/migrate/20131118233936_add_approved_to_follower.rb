class AddApprovedToFollower < ActiveRecord::Migration
  def change
    add_column :followers, :approved, :boolean, default: false
  end
end
