Rails.application.routes.draw do
  resources :officials
  get 'requests/view' => 'requests#view'

  get 'requests' => 'requests#index'

  get 'requests/:id/delete'	=> 'requests#delete'

  get 'requests/:id/transaction_view' => 'requests#transaction_view'

  post 'requests/:id/transaction_view' => 'requests#generate_cert'

  delete 'requests/:id' => 'requests#delete'

  post 'requests' => 'requests#add_transaction'

  get 'requests/:id/cedula_view' => 'requests#cedula_view'

  #post 'requests/:id/cedula_view' => 'requests#generate_cert'

  get 'requests/form' => 'requests#form'

  get '/requests/transactions/' => 'requests#transactions'
  post '/requests/transactions' => 'requests#add_transaction'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "users#new"
  resources :users
  resources :sessions
end
