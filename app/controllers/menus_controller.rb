class MenusController < ApplicationController
  before_filter :authenticate_user!, except: 'show'

  def new
    @place = current_user.place
    @menu = @place.menus.new
  end

  def create
    @place = current_user.place
    @menu = @place.menus.build(params[:menu])
    if @menu.save
      flash[:success] = "Menu created!"
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    @dish = Dish.new
    # @menu = @menu.menus.build
    @menu_category = MenuCategory.new
    @categories = @menu.menu_categories.all
  end

  def update
    @menu = Menu.find(params[:id])
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
    @menus = Menu.all
    @menu = Menu.new
  end

  def destroy
    Menu.find(params[:id]).destroy
    flash[:success] = "Menu destroyed."
    redirect_to menus_path
  end
end