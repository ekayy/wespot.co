class MenuCategoriesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @menu = Menu.find(params[:menu_id])
    @menu_category = @menu.menu_categories.new
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @menu_category = @menu.menu_categories.new(params[:menu_category])
    if @menu_category.save
      flash[:success] = "Menu category created!"
      redirect_to edit_menu_path(@menu)
    else
      render 'new'
    end
  end

  def edit
    @menu_category = MenuCategory.find(params[:id])
  end

  def update
    @menu_category = MenuCategory.find(params[:id])
    if @menu_category.update_attributes(params[:menu_category])
      redirect_to :back
    else
      render 'edit'
    end
  end

  def show
    @menu_category = MenuCategory.find(params[:id])
  end

# action for dashboard
  def index
    @menu = Menu.find(params[:id])
    @menu_categories = MenuCategory.all
  end

  def destroy
    MenuCategory.find(params[:id]).destroy
    flash[:success] = "Menu category destroyed."
    redirect_to :back
  end
end