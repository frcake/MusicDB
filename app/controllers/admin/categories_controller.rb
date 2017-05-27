class  Admin::CategoriesController < AdminController
  #before_action :find_album, only:[:update,:destroy]

  def new_category
    @category = Category.new
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
    params.require(:category).permit(:name,:parent_id,:lft,:rgt,:depth,:children_count)
  end
end
