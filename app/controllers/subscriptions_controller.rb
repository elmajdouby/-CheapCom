class SubscriptionsController < ApplicationController
  require 'date'
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, except: :index
  before_action :format, only: [:new, :show, :edit]
  before_action :set_rates, only: [:new, :edit, :create]
  # GET /subscriptions
  def index
    @inscriptionYear = Date.today.year
    @subscriptionAddPermission = Subscription.where('startdate < ? AND enddate > ? and user_id = ?', Date.today, Date.today,current_user)
    if current_user.role == 'Employé' || !current_user.role.present?
      @subscriptions = policy_scope(Subscription).where(user_id: current_user)
    else
      @subscriptions = policy_scope(Subscription).where('startdate < ? AND enddate > ?', Date.today, Date.today)
    end
  end

  # GET /subscriptions/1
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription.package = 'Personalisé'
    @memberList = []
    @memberAbn = []
    @members = policy_scope(Member).where(user_id: current_user)
    # gon.userCategorie = current_user.type.value
    if @subscription.member.present?
      @member = @subscription.member
      @members.each do |member|
        if !@member.include? member.id.to_s
          @memberList << member
        else
          @memberAbn << member
        end
      end
    else
      @memberList = @members
    end
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new()
    @subscription.user = current_user
    @subscription.package = params[:package]
    @subscription.status = 'En attente de paiment'
    @subscription.amount = params[:amount]
    case @subscription.package
      when 'Basic'
        @subscription.member = @packageBasicMember * ","
      when 'Suplément'
        @subscription.member = @packageBasicMember * ","
        @subscription.membersuplement = @packageSuplementMember * ","
      when 'Tennis'
        @subscription.member = @packageBasicMember * ","
        @subscription.membersuplement = @packageSuplementMember * ","
        @subscription.tennis = @packageTennisMember * ","
    end
    @subscription.startdate = Date.today.at_beginning_of_year
    @subscription.enddate = Date.today.at_end_of_year
    # @subscription.startdate = (Date.parse('01/01/' + Date.today.year.to_s)).to_date
    # @subscription.enddate = (Date.parse('31/12/' + Date.today.year.to_s)).to_date
    if @subscription.save
      if @subscription.package != 'Personalisé'
        redirect_to subscriptions_path, notice: "L'abonnement a été créé avec succès."
      else
        redirect_to edit_subscription_path(@subscription)
      end
    else
      render :new
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      redirect_to subscriptions_path, notice: "L'abonnement a été mis à jour avec succès."
    else
      render :edit
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
    redirect_to subscriptions_url, notice: "L'abonnement a été supprimé avec succès."
  end

  private

  def format
    respond_to do |format|
      format.html
      format.js
    end
  end

  def set_rates
    gon.memberRate = 0
    gon.memberSuplementRate = 0
    gon.tennisRate = 0
    @suplementEnfant = 0
    @packageBasicMember = Array.new
    @packageSuplementMember = Array.new
    @packageTennisMember = Array.new
    if current_user.category.present?
      gon.userCategory = Type.find(current_user.category).value
      y = 0
      @members = policy_scope(Member).where(user_id: current_user)
      @members.each do |member|
        @packageBasicMember << member.id
        @packageTennisMember << member.id
        y = y + 1
        if member.type.value == "Enfant"
          @suplementEnfant = @suplementEnfant + 1
        end
      end
      if @suplementEnfant > 3
        @packageSuplementMember << 1
        @suplementEnfant = @suplementEnfant - 3
      else
        @suplementEnfant = 0
      end
      @rates = policy_scope(Rate.all)
      @rates.each do |rate|
        if gon.userCategory == 'EXTRA'
  # ****************************** EXTRA *********************************
          case rate.description
            when 'EXTRA O.C.P Tarif = 1'
              gon.memberRate = rate.value
            when 'EXTRA O.C.P Tarif = Suplement enfant'
              gon.memberSuplementRate = rate.value
            when 'EXTRA O.C.P Tarif = Tennis'
              gon.tennisRate = rate.value
          end
        else
  # ****************************** O.C.P *********************************
          case rate.description
            when 'O.C.P Tarif = ' + gon.userCategory
              gon.memberRate = rate.value
            when 'O.C.P Tarif = Suplement enfant'
              gon.memberSuplementRate = rate.value
            when 'O.C.P Tarif = Tennis'
              gon.tennisRate = rate.value
          end
        end
      end
      @packageBasic = gon.memberRate
      @packageSuplement = gon.memberRate + (gon.memberSuplementRate * @suplementEnfant)
      @packageTennis = gon.memberRate + (gon.memberSuplementRate * @suplementEnfant) + (gon.tennisRate * y)
    else
      redirect_to subscriptions_path, notice: "Merci d'actualiser votre profile => Catégorie n'est pas rensegnée"
    end
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def subscription_params
    params.require(:subscription).permit(:startdate, :enddate, :package, :member, :membersuplement, :tennis, :amount, :user_id)
  end

  def set_authorize
    authorize @subscription
  end
end
