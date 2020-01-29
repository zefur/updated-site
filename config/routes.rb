Rails.application.routes.draw do
  get 'portfolios/index'
  get 'pages/landing'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs do
    resources :comments
  end
  resources :portfolios
  get 'tags/:tag', to: 'blogs#index', as: :tag
  root 'pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
