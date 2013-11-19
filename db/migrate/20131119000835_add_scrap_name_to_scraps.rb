class AddScrapNameToScraps < ActiveRecord::Migration
  def change
  	add_column :scraps, :scrap_name, :string
  end
end
