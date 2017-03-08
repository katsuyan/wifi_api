class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string  :name
      t.string  :en_name
      t.string  :status
      t.string  :category
      t.string  :place
      t.string  :postalcode
      t.string  :prefecture
      t.string  :address
      t.string  :en_address
      t.string  :phone
      t.string  :time
      t.string  :ssid
      t.string  :limit
      t.string  :procedure
      t.string  :language
      t.string  :url
      t.float   :latitude
      t.float   :longitude
      t.integer :placecode

      t.timestamps
    end
  end
end
