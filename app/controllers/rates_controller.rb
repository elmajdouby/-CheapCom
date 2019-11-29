class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, only: [:new, :show, :edit, :update, :destroy, :create]
  # GET /rates
  def index
    @rates = policy_scope(Rate.all)
  end

  # GET /rates/1
  def show
  end

  # GET /rates/new
  def new
    @rate = Rate.new
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  def create
    @rate = Rate.new(rate_params)

    if @rate.save
      redirect_to @rate, notice: 'Rate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rates/1
  def update
    if @rate.update(rate_params)
      redirect_to @rate, notice: 'Rate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rates/1
  def destroy
    @rate.destroy
    redirect_to rates_url, notice: 'Rate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rate_params
      params.require(:rate).permit(:description, :value, :user_id)
    end

  def set_authorize
    authorize @rate
  end
end
