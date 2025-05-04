module WorkImage
  extend ActiveSupport::Concern
  def show_image(theme_id, image_index)
    theme_images = Image.theme_images(theme_id)  # 模型作用域查询
    image = theme_images[image_index]
    {
      index: image_index,
      name: image.name,
      file: image.file,
      image_id: image.id,
      # 其他元数据（如用户评分）
    }
  end
end