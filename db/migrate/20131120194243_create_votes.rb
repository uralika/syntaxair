class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_number
      t.references :user, index: true
      t.references :scrap, index: true

      t.timestamps
    end
  end
end
