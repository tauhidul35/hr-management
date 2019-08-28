Rails.application.routes.draw do
  root to: 'home#index'

  # Attendances
  get 'attendances', to: 'attendances#index'
  get 'attendances/form', to: 'attendances#form'
  post 'attendances/upload', to: 'attendances#upload'
end
