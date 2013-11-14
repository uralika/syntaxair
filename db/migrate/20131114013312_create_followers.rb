class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :i_follow
      t.string :follows_me

      t.timestamps
    end
  end
end
