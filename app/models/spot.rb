class Spot < ApplicationRecord

  attr_accessor :distance

  def self.getInsideAll(lat, lng, distance = 500, limit = 5)
    ranges = getRange(lat, lng, distance)
    inside_candidates = self.where('latitude < ?',  ranges[:max_lat]).
                            where('latitude > ?',  ranges[:min_lat]).
                            where('longitude < ?', ranges[:max_lng]).
                            where('longitude > ?', ranges[:min_lng])
    inside_candidates.each{ |can| can.distance = getDistance(lat, lng, can.latitude, can.longitude) }
                     .select{ |can| can.distance < distance}
                     .sort_by{ |can| can.distance}[0...limit]
  end

  private
    EARTH_RADIUS = 6378150

    def self.radians(deg)
      deg * Math::PI / 180
    end

    def self.move(lat, lng, distance, direction)
      # 緯線上の移動距離
      latitude_distance = distance * Math.cos(direction * Math::PI / 180)
      # 1mあたりの緯度
      earth_circle = 2 * Math::PI * EARTH_RADIUS
      latitude_per_meter = 360 / earth_circle
      # 緯度の変化量
      latitude_delta = latitude_distance * latitude_per_meter
      new_latitude = lat + latitude_delta
      # 経線上の移動距離
      longitude_distance = distance * Math.sin(direction * Math::PI / 180)
      # 1mあたりの経度
      earth_radius_at_longitude = EARTH_RADIUS * Math.cos(new_latitude * Math::PI / 180)
      earth_circle_at_longitude = 2 * Math::PI * earth_radius_at_longitude
      longitude_per_meter = 360 / earth_circle_at_longitude
      # 経度の変化量
      longitude_delta = longitude_distance * longitude_per_meter
      {lat: new_latitude, lng: lng + longitude_delta}
    end

    def self.getDistance(lat1, lng1, lat2, lng2) # 単位:m
      EARTH_RADIUS *
      Math.acos(Math.cos(radians(lat1)) *
      Math.cos(radians(lat2)) *
      Math.cos(radians(lng2) - radians(lng2)) +
      Math.sin(radians(lat1)) *
      Math.sin(radians(lat2)))
    end

    def self.getRange(lat, lng, distance)
      lat1 = move(lat, lng, distance, 0)[:lat]
      lat2 = move(lat, lng, distance, 180)[:lat]
      lng1 = move(lat, lng, distance, 90)[:lng]
      lng2 = move(lat, lng, distance, 270)[:lng]
      {max_lat: lat1, min_lat: lat2, max_lng: lng1, min_lng: lng2}
    end
end
