BrighterBeginningsAdoptAFamilyProgram::Application.routes.draw do

  devise_for :users
  
  root to: "static_pages#home"

  resources :drives do
    resources :family_member_imports, only: [:new, :create]

  end

  resources :donors

  resources :families do 
    collection { post :import }
    resources :family_members do 
      resources :needs
    end
  end

  resources :organizations
  resources :family_member_imports, only: [:index]


  get '/admin' => 'admin_pages#admin'
  get '/manage_families' => 'admin_pages#manage_families'
  post '/add_location' => 'static_pages#add_location'
  post '/drives/:id/add_admin' => 'drives#add_admin'
  put '/drives/:id/close_drive' => 'drives#close_drive'
  put '/families/:id/toggle_live_status' => 'families#toggle_live_status'
end
