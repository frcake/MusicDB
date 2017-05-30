class CategoriesController < ApplicationController



  def new
    @category = Category.new
  end

  def index

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_path
    else

    end
  end

  private

  def category_params
    params.require(:category).permit(:name,:category_id,:parent_id,:lft,:rgt,:depth,:children_count)
  end

end