class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]

  # GET /adoptions
  # GET /adoptions.json
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
  end

  def show
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  # POST /adoptions.json
  def create
    @adoption = Adoption.new(adoption_params)
    @user = User.find(params[:adoption][:user_id])

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to user_path(@user), notice: 'Adoption was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to @adoption, notice: 'Adoption was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to adoptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:drive_id, :user_id, :family_id, :full_name, :street, :city, :state, :zip, :phone, :company, :drop_location_id, :drop_date_id)
    end
end
