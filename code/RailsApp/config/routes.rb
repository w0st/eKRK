Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  resources :programy_studiow
  mount Root => '/'
end
