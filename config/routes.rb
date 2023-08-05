Rails.application.routes.draw do

  root 'tests#index'

  get '/tests' => 'tests#index', as: :user_root

  namespace :admin do 
     get '/tests' => 'tests#index', as: :root
  end

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do 
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
      post :gist
    end
  end

  namespace :admin do 
    get '/gists' => 'gists#show'
    resources :tests do
      resources :questions, shallow: true  do 
       resources :answers, shallow: true
      end
    end
  end
    
end
