BrighterBeginningsAdoptAFamilyProgram::Application.routes.draw do

  root 'static_pages#home'

  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy]

  resources :drives

  resources :family_member_imports, only: [:new, :create]

  resources :families do 
    post '/update_gift_status' => 'families#update_gift_status'

    resources :family_members do 
      resources :needs
    end
  end

  resources :organizations
  resources :family_member_imports, only: [:index]

  resources :admins, only: [:destroy] 

  get '/data_tables' => 'admin_pages#data_tables'

  # match '/signup',  to: 'users#new', via: 'get'
  match '/faq',  to: 'static_pages#faq', via: 'get'
  match '/shopping_tips',  to: 'static_pages#shopping_tips', via: 'get'

  get '/download_pdf' => 'static_pages#download_pdf'
  get '/super_admin' => 'admin_pages#super_admin'
  get '/cancel_adoption' => 'admin_pages#cancel_adoption'
  get '/reset_drive' => 'admin_pages#reset_drive'
  get '/resend_adoption_confirmation_email' => 'admin_pages#resend_adoption_confirmation_email'
  post '/add_location' => 'static_pages#add_location'
  post '/add_admin' => 'admin_pages#add_admin'
  post '/add_super_admin' => 'admin_pages#add_super_admin'
  get '/remove_admin' => 'admin_pages#remove_admin'
  get '/remove_super_admin' => 'admin_pages#remove_super_admin'
  get '/close_drive' => 'admin_pages#close_drive'
  get '/open_drive' => 'admin_pages#open_drive'
  get '/go_live' => 'admin_pages#go_live'
  get '/adoption_confirmation' => 'users#adoption_confirmation'
end
