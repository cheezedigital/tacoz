require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show, :vegetarian], path: 'our-food'
  resources :locations, only: [:index, :show]
  get '/search' => 'search_results#index'

  get '/our-vegetarian-food' => 'menu_items#vegetarian'

  mount Sidekiq::Web => '/sidekiq'
  namespace :admin do # is only for organziation
    get '/' => 'base#index'

    resources :menu_items
    resources :locations
  end


  #gives us by default. says we have
  #some controller named menu_itmes, and we want all the resource controller actions, however
  #we only want two of them, which is index, and show.
end
