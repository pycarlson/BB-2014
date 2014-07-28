class StaticPagesController < ApplicationController
  http_basic_authenticate_with :name => ENV["P_EMAIL"], :password => ENV["P_GMAIL_USERNAME"]

  def home
    @drive = Drive.last
    @drop_locations = @drive.drop_locations
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

  def how_it_works
  end

  def contact
  end
end
