class MenusController < ApplicationController
  before_filter :authenticate_user!

  def new
    @place = current_user.place
    @menu = @place.menus.build
  end

  def create
    @place = current_user.place
    @menu = @place.menus.build(params[:menu])
    if @menu.save
      flash[:success] = "Menu created!"
      redirect_to 'edit'
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    # @menu = @menu.menus.build
    # @menu_category = @menu.menu_categories
    # @dish = @menu_category.dish
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

  def index
    @menus = Menu.all
  end
end