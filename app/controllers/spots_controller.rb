class SpotsController < ApplicationController

  swagger_controller :Spots, "Spot"
  swagger_api :api do
    summary "Get spots"
    notes 'latとlng または word は必須パラメータです(組み合わせも可能)<br>
           lang: "en" で英語対応にできます。<br><br>
           デフォルト値<br>
           distance: 500, limit: 5<br><br>
           以下の値で試すことができます<br>
           lat: 35.771991, lng: 140.3906614 または word: 渋谷'
    param :query, :lat,      :integer, :optional, "latitude"
    param :query, :lng,      :integer, :optional, "longitude"
    param :query, :word,   :string,  :optional, "word"
    param :query, :distance, :integer, :optional, "distance"
    param :query, :limit,    :integer, :optional, "limit"
    param :query, :lang,     :string,  :optional, "language"
    consumes [ "application/json" ]
    response :ok, "Success"
    response :bad_request, "BadRequest"
  end

  def api
    distance = (params[:distance] || 500).to_f
    limit = (params[:limit] || 5).to_f
    latitude = params[:lat]
    longitude = params[:lng]
    @language = params[:lang]
    word = params[:word]

    if (latitude.nil? or longitude.nil?) and word.nil?
      render :json => {"message": "lat and lng query are required"}, :status => 400
      return
    end

    if word.nil?
      @spots = Spot.getInsideAll(latitude.to_f, longitude.to_f, distance: distance, limit: limit)
    elsif (latitude.nil? or longitude.nil?)
      @spots = Spot.getFromStrAll(word, limit: limit)
    else
      @spots = Spot.getInsideAndFromStrAll(latitude.to_f, longitude.to_f, word, distance: distance, limit: limit)
    end

    render 'api', formats: 'json', handlers: 'jbuilder'
  end
end
