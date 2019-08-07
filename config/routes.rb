Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'divisions#index'
  resources :divisions do
    resources :employees
  end
  resources :projects do
    resources :employees
  end

end
