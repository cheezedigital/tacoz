class MenuItemsController < ApplicationController

  def index
    @items = MenuItem.all.page(params[:page]).per(8)
  end

  def vegetarian
    @items = MenuItem.vegetarian
    render :index 
  end

  def show

  end




end
