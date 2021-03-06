class ResourcesController < ApplicationController

  def index
    if params[:q]
      @resources = Resource.where("name LIKE '%#{params[:q]}%'").limit(10)
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    resource = Resource.find(params[:id])
    resource.update_attributes(params[:resource])
    redirect_to resource
  end

end
