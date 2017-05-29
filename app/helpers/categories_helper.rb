module CategoriesHelper
  def shallow_categories_for_select
    nested_set_options(Category, @category) {|i|
      if !(i.depth >= 2)
        "#{i.root.name if !i.parent_id.nil? } #{'>' unless !i.parent_id}  #{i.name}"
      end
      }.select { |i|
      !i[0].nil? || !i[0].blank?
    }
  end

  def deep_categories_for_select
    nested_set_options(Category, @category) {|i|
      "#{i.root.name unless !i.parent_id} #{'>' unless !i.parent_id}  #{i.name}"
    }
  end
end
