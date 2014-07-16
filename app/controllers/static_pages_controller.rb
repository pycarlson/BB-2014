class StaticPagesController < ApplicationController

  def home
    @drive = Drive.last
    @drop_locations = @drive.drop_locations
    p "*" * 100
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
