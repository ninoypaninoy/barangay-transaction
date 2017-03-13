Rails.application.routes.draw do
  get 'requests/view' => 'requests#view'

  get 'requests' => 'requests#index'

  get 'requests/officials' => 'requests#officials'

  get 'requests/officials_view/:id' => 'requests#officials_view'

   get 'requests/delete/:id'	=> 'requests#delete'

  get 'requests/new_official' => 'requests#new_official'

  get 'requests/:id/edit_officials' => 'requests#edit_officials'

  patch 'requests/officials_view/:id' => 'requests#update'
  put 'requests/officials_view/:id' => 'requests#update'

  post 'requests' => 'requests#add_official'

  get 'requests/transaction_view/:id' => 'requests#transaction_view'

  get 'requests/form' => 'requests#form'
 
  post 'requests/transactions' => 'requests#add_transaction'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "users#new"
  resources :users
  resources :sessions
end
