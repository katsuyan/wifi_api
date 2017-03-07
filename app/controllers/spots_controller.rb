class SpotsController < ApplicationController
  def spots
    @hello = "hello"
    render 'spots', formats: 'json', handlers: 'jbuilder'
  end
end
