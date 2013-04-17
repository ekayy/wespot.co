class MenusController < ApplicationController
  before_filter :authenticate_user!, except: 'show'

  def new
    @place = current_user.place
    @menu = @place.menus.new
  end

  def create
    @place = current_user.place
    @menu = @place.menus.new(params[:menu])
    if @menu.save
      flash[:success] = "Menu created!"
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @place = current_user.place
    @menu = @place.menus.find(params[:id])
    @dish = Dish.new
    # @menu = @menu.menus.build
    @menu_category = MenuCategory.new
    @categories = @menu.menu_categories.all
  end

  def update
    @place = current_user.place
    @menu = @place.menus.find(params[:id])
    if @menu.update_attributes(params[:menu])
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

# action for dashboard
  def index
    @place = current_user.place
    @menus = @place.menus.all
    @menu = Menu.new
  end

  def destroy
    Menu.find(params[:id]).destroy
    flash[:success] = "Menu destroyed."
    redirect_to menus_path
  end
end