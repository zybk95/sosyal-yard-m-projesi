class AidsController < ApplicationController
  before_action :set_aid, only: [:show, :edit, :update, :destroy, :kontrol]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :kontrol, only: [:edit, :destroy]


  # GET /aids
  # GET /aids.json
  def index
    #@aids = Aid.all
    @aids = Aid.search(params[:search])
    @hash = Gmaps4rails.build_markers(@aids) do |aid, marker|
      marker.lat aid.latitude
      marker.lng aid.longitude
      marker.infowindow aid.title
    end
  end

  # GET /aids/1
  # GET /aids/1.json
  def show
    @hash = Gmaps4rails.build_markers(@aid) do |aid, marker|
      marker.lat aid.latitude
      marker.lng aid.longitude
      marker.infowindow aid.title
    end
  end

  # GET /aids/new
  def new
    @aid = Aid.new
  end

  # GET /aids/1/edit
  def edit
  end

  # POST /aids
  # POST /aids.json
  def create
    @aid = Aid.new(aid_params)
    @aid.user=current_user
    @aid.address=%Q{#{@aid.mahalle} Mahallesi #{@aid.cadde} #{@aid.sokak} Sk. No: #{@aid.no} #{@aid.il} #{@aid.ilce} Türkiye}
    respond_to do |format|
      if @aid.save
        format.html { redirect_to @aid, notice: 'Aid was successfully created.' }
        format.json { render :show, status: :created, location: @aid }
      else
        format.html { render :new }
        format.json { render json: @aid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aids/1
  # PATCH/PUT /aids/1.json
  def update
    @aid.address=%Q{#{@aid.mahalle} Mahallesi #{@aid.cadde} #{@aid.sokak} Sk. No: #{@aid.no} #{@aid.il} #{@aid.ilce} Türkiye}
    respond_to do |format|
      if @aid.update(aid_params)
        format.html { redirect_to @aid, notice: 'Aid was successfully updated.' }
        format.json { render :show, status: :ok, location: @aid }
      else
        format.html { render :edit }
        format.json { render json: @aid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aids/1
  # DELETE /aids/1.json
  def destroy
    @aid.destroy
    respond_to do |format|
      format.html { redirect_to aids_url, notice: 'Aid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def kontrol
    unless @aid.user==current_user
      redirect_to aids_path, notice: "Yetkiniz olmayan bir işlem denediniz!"
      unless current_user==@aid.user
      end
    end
  end


  private


    # Use callbacks to share common setup or constraints between actions.
    def set_aid
      @aid = Aid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aid_params
      params.require(:aid).permit(:latitude, :longitude, :title, :category, :aid_type, :explanation, :needy_name, :il, :ilce, :mahalle, :cadde, :sokak, :no, :address)
    end
end
