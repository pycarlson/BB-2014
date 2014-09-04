class StaticPagesController < ApplicationController
  
  POSSIBLE_FILE_NAMES = ["Donation_receipt_AAF_2014.pdf"]

  http_basic_authenticate_with :name => ENV["P_EMAIL"], :password => ENV["P_GMAIL_USERNAME"]

  def home
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Home'
    @drive = Drive.last
    @drop_locations = @drive.drop_locations
    @countdown = @drive.countdown
  end

  def download_pdf
    file_name = POSSIBLE_FILE_NAMES.find { |name| name == params[:file] }

    if file_name.present?
      extension = file_name.split('.').last
      send_file(
        "#{Rails.root}/public/#{file_name}",
        filename: "#{file_name}",
        type: "application/#{extension}"
      )
    end
  end

  def add_location
    user = current_user
    user.drop_location_id = params[:drop_location_id]
    user.save
    redirect_to families_path
  end

  def shopping_tips
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Shopping Tips'
  end

  def faq
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | FAQs'
  end

  def about
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | About'
  end

  def contact
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Contact'
  end
end
