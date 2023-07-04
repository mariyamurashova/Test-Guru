Rails.application.routes.draw do

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: [:new, :create, :destroy]

  resources :tests  do 
    resources :questions, shallow: true do 
      resources :answers, shallow: true
    end
    member  do
      post :start
    end
end

  resources :test_passages do
    member  do
      get :result
    end
  end
    
end
