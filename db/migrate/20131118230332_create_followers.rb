class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :i_follow_id, index:true
      t.integer :follows_me_id, index:true

      t.timestamps
    end
  end
end
