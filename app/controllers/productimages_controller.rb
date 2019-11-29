class ProductimagesController < ApplicationController
  before_action :set_productimage, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, only: [:show, :new, :edit, :update, :destroy]

  def index
    @productimages = policy_scope(Productimage).order(created_at: :desc)
  end

  def new

  end

  # GET /productimages/1/edit
  def edit
  end

  # POST /productimages
  # POST /productimages.json
  def create
    @product = Product.find(params[:product_id])
    @pt = Productimage.new(productimage_params)
    @pt.user = current_user
    @pt.product = Product.find(params[:product_id])
    authorize @pt
    if @pt.save
      logger.info(@pt.photo)
      respond_to do |format|
        format.html { render 'products/show' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'products/show' }
        format.js
      end
    end
  end

  def destroy
   @product = Product.find(@productimage.product_id)
    if @productimage.destroy
      respond_to do |format|
        format.html { render 'products/show' }
        format.js
      end
    end
  end

  private

    def set_productimage
      @productimage = Productimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productimage_params
      params.require(:productimage).permit(:alt, :src, :user_id, :product_id, :photo)
    end
    def set_authorize
      authorize @productimage
    end
end
