class AddIndexSpots < ActiveRecord::Migration[5.0]
  def change
    add_index :spots, :name
    add_index :spots, :en_name
    add_index :spots, :address
    add_index :spots, :en_address
    add_index :spots, :latitude
    add_index :spots, :longitude
  end
end
