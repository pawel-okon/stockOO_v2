module ApplicationHelper
  def main_menu
    [
      { :url => root_path, :label => t("views.home.menu_label.main") },
      { :url => categories_path,
        label: t("views.home.menu_label.category") },
      { :url => manufacturers_path, :label => t("views.home.menu_label.manufacturer") },
      { :url => products_path, :label => 'Produkty' }
    ]
  end

  def sidebar_options(view_name)
    case view_name
    when :categories_index
      [{ :url => new_category_path, :icon => "icon-plus-sign", :label => t("views.categories.create") }]
    when :manufacturers_index
      [{ :url => new_manufacturer_path, :icon => "icon-plus-sign", :label => t("views.manufacturers.create") }]
    when :products_index
      [{ :url => new_product_path, :icon => "icon-plus-sign", :label => t("views.products.create") }]
    end
  end
end
