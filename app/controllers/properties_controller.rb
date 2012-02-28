class PropertiesController < ApplicationController

  def destroy
    Property.find(params[:id]).destroy
    redirect_to edit_resource_path(Resource.find(params[:resource_id]))
  end

end
