class AddUserRefToScraps < ActiveRecord::Migration
  def change
    add_reference :scraps, :user, index: true
  end
end
