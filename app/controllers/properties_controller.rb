class PropertiesController < ApplicationController

  def create
    property = Property.create(params[:property])
    redirect_to edit_resource_path(property.resource)
  end

  def destroy
    Property.find(params[:id]).destroy
    redirect_to edit_resource_path(Resource.find(params[:resource_id]))
  end

end
