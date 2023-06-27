Rails.application.routes.draw do

  #root 'tests#index'

  
  resources :tests  do 
    resources :questions, shallow: true do 
      resources :answers, shallow: true
    end
    member  do
      post :start
    end
end

  #GET /test_passages/101/result
  resources :test_passages do
    member  do
      get :result
    end
  end
    
end
