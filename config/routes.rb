Rails.application.routes.draw do
  devise_for :employees, controllers: {
    omniauth_callbacks: 'employees/omniauth_callbacks'
  }

  # Attendances
  get 'attendances', to: 'attendances#index'
  get 'attendances/form', to: 'attendances#form'
  post 'attendances/upload', to: 'attendances#upload'

  root to: 'home#index'
end
