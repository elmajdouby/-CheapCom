class ProducttypesController < ApplicationController
  before_action :set_producttype, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, only: [:show, :new, :edit, :update, :destroy]

  def index
    @producttypes = policy_scope(Producttype).order(created_at: :desc)
  end

  def show
    @producttype = Producttype.find(params[:id])
  end

  def new
    @producttype = Producttype.new
  end

  def create
    rest = Producttype.new(producttype_params)
    rest.user = current_user
    authorize rest
    rest.save
    redirect_to producttypes_path(rest)
  end

  def edit
  end

  def update
    @producttype = Producttype.find(params[:id])
    @producttype.update(producttype_params)
    redirect_to producttype_path(@producttype)
  end

  def destroy
    @producttype.destroy
    redirect_to producttypes_path
  end

  private

  def producttype_params
    params.require(:producttype).permit(:name, :description)
  end

  def set_producttype
    @producttype = Producttype.find(params[:id])
  end

  def set_authorize
    authorize @producttype
  end
end
