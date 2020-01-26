Rails.application.routes.draw do
  get 'pages/landing'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs do
    resources :comments
  end
  get 'tags/:tag', to: 'blogs#index', as: :tag
  root 'pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
