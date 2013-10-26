SocialServicePlatform::Application.routes.draw do
    get '/getInstitutionsNames', to: 'institutions#getInstitutionsNames', via: :get
    resources :users
    resources :programs
    resources :dependencies
    resources :students
    resources :configurations
    resources :institution_attendants
    resources :dependency_attendants
    resources :sessions, only: [:new, :create, :destroy]
    root to: 'static_pages#home'

    match '/programs/show', to: 'programs#show', :as => 'programs'

    match '/signup/:role', to: 'users#new', :as => 'signup'
    match '/signout', to: 'sessions#destroy', via: :delete


    match '/prueba', to: 'students#field_institutions'
    match '/home', to: 'static_pages#home'
    match '/help', to: 'static_pages#help'
    match '/contact', to: 'static_pages#contact'
    match '/about', to: 'static_pages#about'

end
