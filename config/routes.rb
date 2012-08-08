Reservd::Application.routes.draw do

  resources :resources, :only => [:index, :show, :edit, :update] do
    resources :properties, :only => [:create, :destroy, :update]
  end

end
