Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  post '/callback' => 'linebot#callback'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'household_account_books/edit_one_month'
      patch 'household_account_books/update_one_month'
      get 'household_account_books/edit_one_month_1'
      patch 'household_account_books/update_one_month_1'
      get 'household_account_books/edit_one_month_2'
      patch 'household_account_books/update_one_month_2'
      get 'show_1'
      get 'show_2'
    end
    
    resources :household_account_book, only: :update do
      member do
      end
    end
  end
end