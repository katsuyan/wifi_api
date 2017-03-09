class SpotsController < ApplicationController
  def spots
    if params[:lat].nil? or params[:lng].nil?
      render :json => {"message": "lat and lng query are required"}, :status => 400
    else
      @spots = Spot.getInsideAll(params[:lat].to_f, params[:lng].to_f)
      render 'spots', formats: 'json', handlers: 'jbuilder'
    end
  end
end
