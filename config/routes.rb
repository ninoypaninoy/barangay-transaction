Rails.application.routes.draw do
  resources :officials
  get 'requests/view' => 'requests#view'

  get 'requests' => 'requests#index'

  get 'requests/:id/delete'	=> 'requests#delete'

  get 'requests/:id/transaction_view' => 'requests#transaction_view'

  get 'requests/:id/edit_transactions' => 'requests#edit_transactions'

  post '/generate_cert' => 'requests#generate_cert'

  post '/reminder_def' => 'requests#reminder_def'

  post '/edit_transactions' => 'requests#edit_transactions'

  post 'reminders/' => 'requests#delete_reminder'

  delete 'requests/:id' => 'requests#delete'

  post 'requests' => 'requests#add_transaction'
  post '/update/:id' => 'requests#update_record'

  get 'requests/:id/cedula_view' => 'requests#cedula_view'

  get 'requests/:id/good_moral_view' => 'requests#good_moral_view'

  post 'generate_gm' => 'requests#generate_gm'

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
