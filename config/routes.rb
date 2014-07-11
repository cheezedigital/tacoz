Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show, :vegetarian], path: 'our-food'
  resources :locations, only: [:index, :show]

  
  get '/our-vegetarian-food' => 'menu_items#vegetarian'
  namespace :admin do # is only for organziation
    get '/' => 'base#index'

    resources :menu_items
  end


  #gives us by default. says we have
  #some controller named menu_itmes, and we want all the resource controller actions, however
  #we only want two of them, which is index, and show.
end
