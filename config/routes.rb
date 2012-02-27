Reservd::Application.routes.draw do

  resources :resources, :only => [:index]

end
