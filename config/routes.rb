SocialServicePlatform::Application.routes.draw do

    resources :users
    resources :students
    resources :sessions, only: [:new, :create, :destroy]

    match '/signup', to: 'users#new'
    match '/signin', to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete

    root to: 'static_pages#home'

    match "/getInstitutionsNames", to: 'institutions#getInstitutionsNames', via: :get
    match '/home', to: 'static_pages#home'
    match '/help', to: 'static_pages#help'
    match '/contact', to: 'static_pages#contact'
    match '/about', to: 'static_pages#about'

end
