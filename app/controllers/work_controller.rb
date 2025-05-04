class WorkController < ApplicationController
  def index
    @selected_theme = "Select a topic to start your assessment"
    @selected_image_name = 'Cat'
    @current_locale = I18n.locale
  end

  def choose_theme
    @themes = Theme.all.pluck(:name) # 获取所有主题名称
    respond_to :html, :js
  end

  def display_theme
    theme = params[:theme]
    # 根据主题加载图片数据（调用 WorkImage 模块）
    @image_data = show_image(theme_id, 0)
    respond_to :js
  end
end
