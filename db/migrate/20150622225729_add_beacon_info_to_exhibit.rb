class AddBeaconInfoToExhibit < ActiveRecord::Migration
  def change
    add_column :exhibits, :beacon, :integer
  end
end
