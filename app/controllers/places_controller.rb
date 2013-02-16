class PlacesController < ApplicationController
  before_filter :authenticate_user!, only: ['new','create','edit','update']

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    @place = Place.find(params[:id])
    begin
      @instagram = Instagram.tag_recent_media(@place.instagram_tag)
    rescue
      @instagram = Instagram.tag_recent_media('wespot')
    end
  end

  def widget
    @place = Place.find(params[:id])
    @instagram = Instagram.tag_recent_media('localmissioneatery')
    respond_to do |format|
      format.html {render :layout => false}
      format.js
    end
  end
end
