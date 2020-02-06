class AlterPlacesAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :bootcamps, :latitude, :float
    add_column :bootcamps, :longitude, :float
  end
end
