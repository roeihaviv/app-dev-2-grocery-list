Rails.application.routes.draw do
  root "items#index"
  
  devise_for :users

  resources :items do
    patch "move", on: :member
  end

  get("/cart", { :controller => "items", :action => "cart" })
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
