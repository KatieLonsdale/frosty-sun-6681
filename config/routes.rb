Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  
  resources :doctors, only: [:show] do
    resources :doctor_patients, only: [:destroy]
  end

  resources :patients, only: [:index]

  resources :hospitals, only: [:show]
end