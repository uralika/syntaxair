class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.text :body
      t.string :search_tag
      #t.integer :vote_number

      t.timestamps
    end
  end
end
