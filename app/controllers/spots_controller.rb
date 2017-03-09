class SpotsController < ApplicationController
  def spots
    distance = params[:distance] || 500
    limit = params[:limit] || 5
    latitude = params[:lat]
    longitude = params[:lng]

    if params[:lat].nil? or params[:lng].nil?
      render :json => {"message": "lat and lng query are required"}, :status => 400
    else
      @spots = Spot.getInsideAll(latitude.to_f, longitude.to_f, distance.to_f, limit.to_i)
      render 'spots', formats: 'json', handlers: 'jbuilder'
    end
  end
end
