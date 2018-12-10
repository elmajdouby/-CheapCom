class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy]
  after_action :set_authorize, only: [:show, :new, :create, :edit, :update, :destroy, :buy]
  # GET /products
  # GET /products.json
  def index
    if params[:query].present?
      sql_query = " \
        products.name ILIKE :query \
        OR products.description ILIKE :query \
      "
      @products = policy_scope(Product).where(sql_query, query: "%#{params[:query]}%")

      # @products =  policy_scope(Product).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @products =  policy_scope(Product).order(created_at: :desc)
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @productimagefirst = Productimage.where("product_id = ?", params[:id]).limit(1)
    @product = Product.find(params[:id])
    @productimage = Productimage.new
    @productimages = Productimage.where("product_id = ?", params[:id])

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def buy

  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    respond_to do |format|
      if @product.save
        if params[:product_images] != nil
          params[:product_images]["photo"].each do |pic|
            @product.productimages.create!(photo: pic, user: current_user)
          end
        end
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.js

      else
        format.html { render :new }
        format.js
      end
    end
  end

  # search methode
  def search
    if params[:query].present?
      sql_query = " \
        products.name ILIKE :query \
        OR products.description ILIKE :query \
      "
      @products = policy_scope(Product).where(sql_query, query: "%#{params[:query]}%")
    else
      @products =  policy_scope(Product).order(created_at: :desc)
    end
    authorize @products
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :thumb, :description, :user_id, :producttype_id)
    end

     def set_authorize
      authorize @product
     end
end
