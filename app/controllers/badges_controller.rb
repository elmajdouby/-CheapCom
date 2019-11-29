class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, only: [:new, :show, :edit, :update, :destroy, :create]
  # GET /badges
  def index
    @badges = policy_scope(Badge).where(user_id: current_user)
  end

  # GET /badges/1
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to @badge, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /badges/1
  def update
    if @badge.update(badge_params)
      redirect_to @badge, notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /badges/1
  def destroy
    @badge.destroy
    redirect_to badges_url, notice: 'Badge was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def badge_params
      params.require(:badge).permit(:startdate, :enddate, :number, :member_id, :user_id)
    end

    def set_authorize
      authorize @badge
    end
end
