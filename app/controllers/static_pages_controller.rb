class StaticPagesController < ApplicationController
  
  POSSIBLE_FILE_NAMES = ["Donation_receipt_AAF_2014.pdf"]

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
    redirect_to all_families_path
  end

  def update_drop_location
    user = User.find(params[:user_id])
    redirect_to root_path unless user.id == current_user.id
    if User.has_adoptions(user)
      flash[:alert] = "It looks like you have already adopted one or more families from your current drop location. Please contact Brighter Beginnings if you still want to change your drop location preference."
      redirect_to user_path(user)
    else
      user.drop_location_id = nil
      user.save
      flash[:notice] = "You can now choose a new location. Click on the 'choose location' button below or the 'browse families' button in the Navigation bar at the top of the page."
      redirect_to user_path(user)
    end  
  end

  def shopping_tips
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Shopping Tips'
  end

  def faq
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Frequently Asked Questions'
  end

  def about
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | About'
  end

  def contact
    @page_title = 'Brighter Beginnings Adopt-a-Family Program | Contact'
  end
end
