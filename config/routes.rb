Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :reservations do
        resources :comments
      end
    end
  end
  
  resources :welcome do
    collection do
      get 'user'
    end
  end
  
  post 'sessions/sign_in' => 'sessions#create'
  
end
