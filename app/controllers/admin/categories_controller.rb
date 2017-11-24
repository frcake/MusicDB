class Admin::CategoriesController < AdminController
  before_action :require_admin

  def new_category
    @category = Category.new
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
    params.require(:category).permit(:name, :parent_id, :lft, :rgt, :depth, :children_count)
  end
end
