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
    @instagram = Instagram.tag_recent_media(@place.instagram_tag) if @place.instagram_tag
    respond_to do |format|
      format.html
      format.json {render :json => @instagram}
    end
  end

  def embed
    @place = Place.find(params[:id])
    @instagram = Instagram.tag_recent_media(@place.instagram_tag) if @place.instagram_tag
    respond_to do |format|
      format.html {render :layout => false}
      format.js
    end
  end
end
