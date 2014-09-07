BrighterBeginningsAdoptAFamilyProgram::Application.routes.draw do

  resources :adoptions do 
    post '/update_gift_status' => 'adoptions#update_gift_status'
  end

  root 'static_pages#home'

  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy]

  resources :drives

  resources :family_member_imports, only: [:new, :create]

  resources :families do 
   
    resources :family_members do 
      resources :needs
    end
  end

  resources :organizations
  resources :family_member_imports, only: [:index]

  resources :admins, only: [:create, :destroy] 
  resources :super_admins, only: [:create, :destroy] 

  get '/data_tables' => 'admin_pages#data_tables'

  # match '/signup',  to: 'users#new', via: 'get'
  match '/faq',  to: 'static_pages#faq', via: 'get'
  match '/shopping_tips',  to: 'static_pages#shopping_tips', via: 'get'

  match '/families_of_five_or_more',  to: 'families#families_of_five_or_more', via: 'get'
  match '/families_of_four',  to: 'families#families_of_four', via: 'get'
  match '/families_of_three',  to: 'families#families_of_three', via: 'get'
  match '/families_of_two_and_under',  to: 'families#families_of_two_and_under', via: 'get'
  get '/download_pdf' => 'static_pages#download_pdf'
  get '/super_admin_page' => 'admin_pages#super_admin_page'
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
