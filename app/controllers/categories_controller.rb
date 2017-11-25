class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.includes(:albums).all
  end

  def show
    @category = Category.find(params[:id])
    @albums = Album.includes(:photos).where(category_id: @category.id)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created!'
      redirect_to root_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :category_id, :parent_id, :lft, :rgt, :depth, :children_count)
  end
end
