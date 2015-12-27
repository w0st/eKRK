Rails.application.routes.draw do
  resources :users

  mount Root => '/'
end
