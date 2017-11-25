module CategoriesHelper
  def shallow_categories_for_select
    nested_set_options(Category, @category) do |i|
      if i.depth < 2
        "#{i.root.name unless i.parent_id.nil?} #{'>' if i.parent_id}  #{i.name}"
      end
    end.select do |i|
      !i[0].nil? || !i[0].blank?
    end
  end

  def deep_categories_for_select
    nested_set_options(Category, @category) do |i|
      "#{i.root.name if i.parent_id} #{'>' if i.parent_id}  #{i.name}"
    end
  end
end
