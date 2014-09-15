module ApplicationHelper
  def main_menu
    [
      { :url => root_path, :label => t("views.home.menu_label.main") },
      { :url => api_v1_categories_path,
        label: t("views.home.menu_label.category") },
      { :url => api_v1_manufacturers_path,
        :label => t("views.home.menu_label.manufacturer") },
      { :url => api_v1_products_path, :label => 'Produkty' }
    ]
  end

  def sidebar_options(view_name)
    case view_name
    when :categories_index
      [{ :url => new_api_v1_category_path, :icon => "icon-plus-sign",
         :label => t("views.categories.create") }]

    when :categories_show
      [{ url: api_v1_categories_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") },
      { url: edit_api_v1_category_path(@category), icon: 'icon-edit',
         label: 'Edycja' }]

    when :categories_create_edit
      [{ url: api_v1_categories_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") }]

    when :manufacturers_index
      [{ :url => new_api_v1_manufacturer_path, :icon => "icon-plus-sign",
         :label => t("views.manufacturers.create") }]

    when :manufacturers_create_edit
      [{ url: api_v1_manufacturers_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") }]

    when :manufacturers_show
      [{ url: api_v1_manufacturers_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") },
      { url: edit_api_v1_manufacturer_path(@manufacturer), icon: 'icon-edit',
         label: 'Edycja' }]

    when :products_index
      [{ :url => new_api_v1_product_path, :icon => "icon-plus-sign",
         :label => t("views.products.create") }]

    when :products_create_edit
      [{ url: api_v1_products_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") }]

    when :products_show
      [{ url: api_v1_products_path, icon: 'icon-backward',
         label: t("views.shared.sidebar_back_to_list") },
      { url: edit_api_v1_product_path(@product), icon: 'icon-edit',
         label: 'Edycja' }]

    when :main_page
      [{ :url => new_api_v1_category_path, :icon => "icon-plus-sign",
         :label => t("views.categories.create") },
      { :url => new_api_v1_manufacturer_path, :icon => "icon-plus-sign",
         :label => t("views.manufacturers.create") },
      { :url => new_api_v1_product_path, :icon => "icon-plus-sign",
         :label => t("views.products.create") }]
    end
  end
end
