class SpotsController < ApplicationController

  swagger_controller :Spots, "Spot"
  swagger_api :api do
    summary "Get spots"
    notes 'latとlng または search は必須パラメータです(どちらか片方)<br>
           lang: "en" で英語対応にできます。<br><br>
           デフォルト値<br>
           distance: 500, limit: 5<br><br>
           以下の値で試すことができます<br>
           lat: 35.771991, lng: 140.3906614 または search: 渋谷'
    param :query, :lat,      :integer, :optional, "latitude"
    param :query, :lng,      :integer, :optional, "longitude"
    param :query, :search,   :string,  :optional, "search"
    param :query, :distance, :integer, :optional, "distance"
    param :query, :limit,    :integer, :optional, "limit"
    param :query, :lang,     :string,  :optional, "language"
    consumes [ "application/json" ]
    response :ok, "Success"
    response :bad_request, "BadRequest"
  end

  def api
    distance = params[:distance] || 500
    limit = params[:limit] || 5
    latitude = params[:lat]
    longitude = params[:lng]
    @language = params[:lang]
    search = params[:search]

    if (latitude.nil? or longitude.nil?) and search.nil?
      render :json => {"message": "lat and lng query are required"}, :status => 400
    elsif search.nil?
      @spots = Spot.getInsideAll(latitude.to_f, longitude.to_f, distance: distance.to_f, limit: limit.to_i)
      render 'api', formats: 'json', handlers: 'jbuilder'
    elsif (latitude.nil? or longitude.nil?)
      @spots = Spot.getFromStrAll(search, limit: limit)
      render 'api', formats: 'json', handlers: 'jbuilder'
    else

    end
  end
end
