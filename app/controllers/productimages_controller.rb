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
    @product = Product.find(params[:product_id])
  end

  # GET /productimages/new
  def new

  end

  # GET /productimages/1/edit
  def edit
  end

  # POST /productimages
  # POST /productimages.json
  def create
    @product = Product.find(params[:product_id])
    pt = Productimage.new(productimage_params)
    pt.user = current_user
    pt.product = Product.find(params[:product_id])
    authorize pt
    if pt.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
       # <-- will render `app/views/reviews/create.js.erb`
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
    @productimage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

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
