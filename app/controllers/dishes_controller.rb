class DishesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @dish = @menu_category.dishes.new
  end

  def create
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @dish = @menu_category.dishes.new(params[:dish])
    if @dish.save
      flash[:success] = "Menu category created!"
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(params[:dish])
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
    Dish.find(params[:id]).destroy
    flash[:success] = "Menu category destroyed."
    redirect_to :back
  end
end