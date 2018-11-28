class ProductimagesController < ApplicationController
  before_action :set_productimage, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, only: [:show, :new, :edit, :update, :destroy]
  # GET /productimages
  # GET /productimages.json
  def index
    @productimages = policy_scope(Productimage).order(created_at: :desc)
  end

  # GET /productimages/1
  # GET /productimages/1.json
  def show
  end

  # GET /productimages/new
  def new
    @productimage = Productimage.new
  end

  # GET /productimages/1/edit
  def edit
  end

  # POST /productimages
  # POST /productimages.json
  def create
    @productimage = Productimage.new(productimage_params)

    respond_to do |format|
      if @productimage.save
        format.html { redirect_to @productimage, notice: 'Productimage was successfully created.' }
        format.json { render :show, status: :created, location: @productimage }
      else
        format.html { render :new }
        format.json { render json: @productimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productimages/1
  # PATCH/PUT /productimages/1.json
  def update
    respond_to do |format|
      if @productimage.update(productimage_params)
        format.html { redirect_to @productimage, notice: 'Productimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @productimage }
      else
        format.html { render :edit }
        format.json { render json: @productimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productimages/1
  # DELETE /productimages/1.json
  def destroy
    @productimage.destroy
    respond_to do |format|
      format.html { redirect_to productimages_url, notice: 'Productimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productimage
      @productimage = Productimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productimage_params
      params.require(:productimage).permit(:alt, :src, :user_id, :product_id)
    end
    def set_authorize
      authorize @productimage
    end
end
