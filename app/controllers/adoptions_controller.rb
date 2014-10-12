class AdoptionsController < ApplicationController

  before_action :set_adoption, only: [:show, :edit, :update, :destroy, :update_gift_status]

  def index
    @adoptions = Adoption.order(drop_location_id: :asc, family_code: :asc)
    respond_to do |format|
      format.html
      format.csv { render text: @adoptions.to_csv }
    end
  end

  def new
    @family = Family.find(params[:family_id])
    @new = true
    @adoption = Adoption.new
    unless current_user.drop_location_id == 0
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def create
    family = Family.find(params[:adoption][:family_id])
    if family.adopted == false
      @adoption = Adoption.new(adoption_params)
    elsif family.adopted == true
      flash[:alert] = "It looks like you will have to go back to searching. This family has already been adopted."
    end

    respond_to do |format|
      if @adoption.save
        family.adopted = true
        family.adoption_id = @adoption.id
        family.save

        user = User.find(@adoption.user_id)
        user.update_attributes(first_name: @adoption.first_name,
        last_name: @adoption.last_name,
        street: @adoption.street,
        city: @adoption.city,
        state: @adoption.state,
        zip: @adoption.zip,
        phone: @adoption.phone,
        company: @adoption.company,
        drop_date_id: @adoption.drop_date_id)

        UserMailer.adoption_confirmation(user, family).deliver

        format.html { redirect_to user_path(user), notice: 'Adoption was successfully created.' }

      else
        format.html { render action: 'new' }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @family = Family.find(@adoption.family_id)
    @editing = true
    unless current_user.drop_location_id == 0
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def update 
    user = current_user
    if @adoption.update_attributes(adoption_params)
      user = User.find(@adoption.user_id)
      user.update_attributes(first_name: @adoption.first_name,
      last_name: @adoption.last_name,
      street: @adoption.street,
      city: @adoption.city,
      state: @adoption.state,
      zip: @adoption.zip,
      phone: @adoption.phone,
      company: @adoption.company,
      drop_date_id: @adoption.drop_date_id)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def update_gift_status
    @adoption.update_attributes(:given_to_family => params[:given_to_family],
                              :received_at_org => params[:received_at_org],
                              :num_boxes => params[:num_boxes])
    
    redirect_to data_tables_path
  end

  def destroy
    fam = Family.find(@adoption.family_id)
    fam.adopted = false
    fam.adoption_id = nil
    fam.save

    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to data_tables_path }
      format.json { head :no_content }
    end
  end

  private
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    def adoption_params
      params.require(:adoption).permit(:drive_id, :user_id, :family_id, :family_code, :first_name, :last_name, :email, :street, :city, :state, :zip, :phone, :company, :drop_location_id, :drop_location_name, :drop_date_id, :drop_off_date, :received_at_org, :given_to_family, :num_boxes)
    end
  end
