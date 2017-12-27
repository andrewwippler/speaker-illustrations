Rails.application.routes.draw do
  root 'tags#index'
  get 'illustrations/search' => 'illustrations#search'
  get 'tags/search' => 'tags#search'
  resources :tags
  resources :illustrations
  resources :places  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
