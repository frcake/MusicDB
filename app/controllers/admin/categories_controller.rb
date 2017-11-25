class Admin::CategoriesController < AdminController
  before_action :require_admin

  def new_category
    @category = Category.new
    construct_category_tree
    binding.pry
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created!'
      redirect_to root_path
    end
  end

  private

  def construct_category_tree
    @child_categories = []
    @grand_child_categories = []
    @root_categories = Category.roots
    @root_categories.each do |category|
      category.descendants.each do |r|
        if r.depth == 1
          @child_categories << r
        elsif r.depth == 2
          @grand_child_categories << r
        end
      end
    end
  end

  def category_params
    params.require(:category).permit(:name, :parent_id, :lft, :rgt, :depth, :children_count)
  end
end
