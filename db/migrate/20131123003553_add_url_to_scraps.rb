class AddUrlToScraps < ActiveRecord::Migration
  def change
    add_column :scraps, :url, :string
  end
end
