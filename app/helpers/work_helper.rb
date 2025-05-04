module WorkHelper
  def image_data(theme, data)
    {
      theme: theme,
      name: data[:name],
      file: data[:file],
      # 其他字段映射...
    }
  end
end
