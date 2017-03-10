class SpotsController < ApplicationController

  swagger_controller :Spots, "Spot"
  swagger_api :api do
    summary "Get spots"
    param :query, :lat,      :integer, :required, "latitude"
    param :query, :lng,      :integer, :required, "language"
    param :query, :distance, :integer, :optional, "distance"
    param :query, :limit,    :integer, :optional, "limit"
    consumes [ "application/json" ]
    response :ok, "Success", :Spots
    response :bad_request, "BadRequest"
  end

  swagger_model :Spots do
    description "Spots object"
    property :name, :string, :required, "name"
    property :address, :string, :required, "address"
    property :distance, :float, :required, "distance"
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
