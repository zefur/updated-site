Rails.application.routes.draw do
  get 'pages/landing'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs

  root 'pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
