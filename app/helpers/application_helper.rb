module ApplicationHelper
  def main_menu
      { :url => root_path, :label => t("menu_labels.home") }
  end

  def sidebar_options(view_name)
    case view_name
    when :categories_index
      [{ :url => new_category_path, :icon => "icon-plus", :label => t("views.categories_index.add_category") }]
  end
end

end
