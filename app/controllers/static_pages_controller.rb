class StaticPagesController < ApplicationController
  http_basic_authenticate_with :name => "hi", :password => "there"

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
