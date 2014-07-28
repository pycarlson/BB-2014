BrighterBeginningsAdoptAFamilyProgram::Application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  
  root to: "static_pages#home"

  resources :drives

  resources :family_member_imports, only: [:new, :create]


  resources :families do 
    resources :family_members do 
      resources :needs
    end
  end

  resources :organizations
  resources :family_member_imports, only: [:index]

  resources :admins, only: [:destroy] 

  get '/super_admin' => 'admin_pages#super_admin'
  get '/cancel_adoption' => 'admin_pages#cancel_adoption'
  get '/resend_adoption_confirmation_email' => 'admin_pages#resend_adoption_confirmation_email'
  get '/shopping_tips' => 'static_pages#shopping_tips'
  get '/faq' => 'static_pages#faq'
  get '/data_tables' => 'admin_pages#data_tables'
  post '/add_location' => 'static_pages#add_location'
  post '/add_admin' => 'admin_pages#add_admin'
  delete '/remove_admin' => 'admin_pages#remove_admin'
  put '/drives/:id/close_drive' => 'drives#close_drive'
  put '/families/:id/toggle_live_status' => 'families#toggle_live_status'
  get '/adoption_confirmation' => 'users#adoption_confirmation'
end
