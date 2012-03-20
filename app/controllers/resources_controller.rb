class ResourcesController < ApplicationController

  def index
    unless params[:q].empty?
      @search_term = params[:q]
      @resources = Resource.where("name LIKE '%#{@search_term}%'").limit(10)
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
