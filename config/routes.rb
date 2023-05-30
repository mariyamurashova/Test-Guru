Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'test_questions#index'

  resources :tests  do 
    resources :questions#, shallow: true 
  end
   
    
end
