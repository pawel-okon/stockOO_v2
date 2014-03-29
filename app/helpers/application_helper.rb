module ApplicationHelper
  def main_menu
      { :url => root_path, :label => t("menu_labels.home") }
  end
end
