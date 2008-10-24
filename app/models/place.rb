class Place < ActiveRecord::Base
  
  def self.new_from_json(feature)
    geom = feature["geometry"]["type"].downcase
    coords =  feature["geometry"]["coordinates"].join(" ")
    georss = "<georss:#{geom}>#{coords}</georss:#{geom}>"

    @location, @georss_tags = GeoRuby::SimpleFeatures::Geometry.from_georss_with_tags(georss)

    Place.new(feature[:properties].merge(:geometry => @location))

  end
end
