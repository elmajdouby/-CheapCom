class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy]
  after_action :set_authorize, only: [:show, :new, :create, :edit, :update, :destroy, :buy]
  skip_after_action :verify_authorized, only: [:search]
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
    @user = Product.find(params[:id]).user
    unless @user.latitude.nil? && @user.longitude.nil?
      @markers = [@user].map do |cordinate|
        {
          lng: cordinate.longitude,
          lat: cordinate.latitude,
          infoWindow: { content: render_to_string(partial: "/shared/info_windows", locals: { cordinate: cordinate }) }
        }
      end
    end
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
      @search_query = params[:query]
    else
      @products = policy_scope(Product).order(created_at: :desc)
    end

    if params[:distance].present?
      close_users = User.near([current_user.latitude,current_user.longitude], params[:distance].to_i)
      @products = @products.map {|product| product if close_users.include? product.user}.compact
    end

    logger.info("===> " + @products.to_json)

    @markers = @products.group_by(&:user_id).map do |product|
      {
        lng: User.find(product[0]).longitude,
        lat: User.find(product[0]).latitude,
        infoWindow: {
          content: render_to_string(partial: "/shared/info_windows_carousel",
            locals: { productmarker: product[1]})
        }
      }
    end
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
      params.require(:product).permit(:name, :thumb, :price, :description, :user_id, :producttype_id)
    end

     def set_authorize
      authorize @product
     end
end
