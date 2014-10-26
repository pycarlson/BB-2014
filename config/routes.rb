BrighterBeginningsAdoptAFamilyProgram::Application.routes.draw do

  resources :adoptions do 
    post '/update_gift_status' => 'adoptions#update_gift_status'
  end

  root 'static_pages#home'

  devise_for :users
  
  resources :users

  resources :drives, except: [:index, :show]

  resources :family_member_imports, only: [:index, :new, :create]

  resources :families do 
    resources :family_members do 
      resources :needs
    end
  end

  resources :family_members, only: [:index] 
  resources :organizations, except: [:index, :show]
  resources :admins, only: [:new, :create, :destroy] 
  resources :super_admins, only: [:new, :create, :destroy] 

  get '/data_tables' => 'admin_pages#data_tables'
  get '/faq',  to: 'static_pages#faq'
  get '/shopping_tips',  to: 'static_pages#shopping_tips'
  get '/super_admin_page' => 'admin_pages#super_admin_page'
  get '/all_families',  to: 'families#all_families'
  get '/families_of_five_or_more',  to: 'families#families_of_five_or_more'
  get '/families_of_four',  to: 'families#families_of_four'
  get '/families_of_three',  to: 'families#families_of_three'
  get '/families_of_two_and_under',  to: 'families#families_of_two_and_under'
  get '/adoption_data',  to: 'admin_pages#adoption_data'
  get '/user_data',  to: 'admin_pages#user_data'
  get '/donor_data',  to: 'admin_pages#donor_data'
  get '/family_data',  to: 'admin_pages#family_data'
  get '/download_pdf' => 'static_pages#download_pdf'
  get '/reset_drive' => 'admin_pages#reset_drive'
  get '/resend_adoption_confirmation_email' => 'admin_pages#resend_adoption_confirmation_email'
  post '/add_location' => 'static_pages#add_location'
  get '/update_drop_location' => 'static_pages#update_drop_location'
  post '/add_admin' => 'admin_pages#add_admin'
  post '/add_super_admin' => 'admin_pages#add_super_admin'
  get '/close_drive' => 'admin_pages#close_drive'
  get '/open_drive' => 'admin_pages#open_drive'
  get '/go_live' => 'admin_pages#go_live'
end
