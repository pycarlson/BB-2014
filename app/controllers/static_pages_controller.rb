class StaticPagesController < ApplicationController
  
  POSSIBLE_FILE_NAMES = ["tax_receipt.pdf", "test2.pdf"]

  http_basic_authenticate_with :name => ENV["P_EMAIL"], :password => ENV["P_GMAIL_USERNAME"]

  def home
    @drive = Drive.last
    @drop_locations = @drive.drop_locations
    @families = Family.all
    @left_unadopted = Family.get_total_adoptions
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
  end

  def faq
  end

  def about
  end

  def contact
  end
end
