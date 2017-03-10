class SpotsController < ApplicationController

  swagger_controller :spots, "Spot"
  swagger_api :api do
    summary "Get spots"
    param :query, :lat,      :integer, :optional, "latitude"
    param :query, :lng,      :integer, :optional, "language"
    param :query, :distance, :integer, :optional, "distance"
    param :query, :limit,    :integer, :optional, "limit"
    consumes [ "application/json" ]
    response :ok, "Success"
    response :bad_request
  end

  def api
    distance = params[:distance] || 500
    limit = params[:limit] || 5
    latitude = params[:lat]
    longitude = params[:lng]

    if params[:lat].nil? or params[:lng].nil?
      render :json => {"message": "lat and lng query are required"}, :status => 400
    else
      @spots = Spot.getInsideAll(latitude.to_f, longitude.to_f, distance: distance.to_f, limit: limit.to_i)
      render 'api', formats: 'json', handlers: 'jbuilder'
    end
  end
end
