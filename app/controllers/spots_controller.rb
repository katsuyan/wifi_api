class SpotsController < ApplicationController
  def spots
    @spots = Spot.getInside(35.771991, 140.3906614, 500)
    render 'spots', formats: 'json', handlers: 'jbuilder'
  end
end
