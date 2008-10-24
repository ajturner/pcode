class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.integer :pcode
      t.geometry :geometry, :srid => 4326
      t.string :country
      t.string :region
      t.string :city
      
      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
