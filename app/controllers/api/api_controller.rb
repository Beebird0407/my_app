module Api
  class ApiController < ApplicationController
    include WorkImage
    def prev_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i
      new_image_index = prev_index(current_index, length)  # 使用 prev_index 方法
      prev_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.json { render json: { error: "Invalid index" }, status: :unprocessable_entity }
        else
          format.json {
            render json: {
              new_image_index: prev_image_data[:index],
              name: prev_image_data[:name],
              file: prev_image_data[:file],
              image_id: prev_image_data[:image_id],
              user_valued: prev_image_data[:user_valued],
              common_ave_value: prev_image_data[:common_ave_value],
              value: prev_image_data[:value],
              status: :success,
              notice: 'Successfully listed to previous'
            }
          }
        end
      end
    end
    def next_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i

      new_image_index = next_index(current_index, length)
      next_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.html{render nothing: true, status:
            :unprocessable_entity}
          format.json {}
        else
          format.html{render display_theme_path, status:
            :successfully}
          format.json{render json:
                               {new_image_index: next_image_data[:index],
                                name: next_image_data[:name],
                                file: next_image_data[:file],
                                image_id: next_image_data[:image_id],
                                user_valued: next_image_data[:user_valued],
                                common_ave_value:
                                  next_image_data[:common_ave_value],
                                value: next_image_data[:value],
                                status: :successfully,
                                notice: 'Successfully listed to next'} }
        end
      end
      end
    def next_index(index, length)
      new_index = index
      index < length-1 ? new_index += 1 : new_index = 0
      new_index
    end

    def prev_index(index, length)
      new_index = index
      index > 0 ? new_index -= 1 : new_index = length-1
      new_index
    end
  end
end