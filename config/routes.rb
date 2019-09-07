Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees, controllers: {
    omniauth_callbacks: 'employees/omniauth_callbacks'
  }

  namespace :admins do
    resources :dashboard, only: [:index]
    resources :employees

    resources :attendances, only: [:index] do
      collection do
        get :form
        post :upload
      end
    end
  end

  resources :attendances, only: [:index]

  root to: 'home#index'
end
