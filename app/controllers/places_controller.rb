class PlacesController < ApplicationController
  before_filter :authenticate_user!, only: ['new','create','edit','update', 'admin']
  # caches_page :show, :if => Proc.new { |c| c.request.format.json? }
  # layout :false, :only => [:show]

  def edit
    @user = current_user
    @place = current_user.place
  end

  def update
    @user = current_user
    @place = current_user.place
    if @place.update_attributes(params[:place])
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    if params[:id]
      @place = Place.find(params[:id])
    else
      @place = Place.find_by_subdomain!(request.subdomain)
      # @instagram = Instagram.tag_recent_media(@place.instagram_tag)
    end
    if @place.instagram_tag.present?
      @instagram = Instagram.tag_recent_media(@place.instagram_tag)
    end
    respond_to do |format|
      format.html
      format.json {render :json => @instagram}
    end
  end

  def menu
    if params[:id]
      @place = Place.find(params[:id])
    else
      @place = Place.find_by_subdomain!(request.subdomain)
    end
    @menus = @place.menus
  end

  def photo
    if params[:id]
      @place = Place.find(params[:id])
    else
      @place = Place.find_by_subdomain!(request.subdomain)
    end
    @menus = @place.menus
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
