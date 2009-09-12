ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :pages

  map.root :controller => "unlock"
  map.more "more",
    :controller => "unlock",
    :action => "more"
  map.privacy "privacy",
    :controller => "unlock", 
    :action => "privacy"

  map.auth "auth/:action", :controller => "auth"

  map.unlock "*anything",
    :controller => "unlock",
    :action => "show"

end
