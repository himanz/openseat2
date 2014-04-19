class AddStartResEndResToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :start_res, :integer
    add_column :restaurants, :end_res, :integer
  end
end
