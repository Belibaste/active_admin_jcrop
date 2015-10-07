module ActiveAdminJcrop
  module DSL
    
    def jcropable
      member_action :jcropper, method: :put do
        if params[:image_data][:object_class] != resource.class.to_s.demodulize.underscore
          child_model = params[:image_data][:object_class].classify.constantize.find(params[:image_data][:object_id])
          child_model.active_admin_crop! params[:image_data]
        else
          resource.active_admin_crop! params[:image_data]
        end
        
        respond_to do |format|
          format.js { render json: true }
        end
      end
    end
  end
end
