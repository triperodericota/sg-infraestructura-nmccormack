Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do 
    get 'latest', on: :collection
    get 'previous', on: :member
  end

  root 'posts#latest'
end
