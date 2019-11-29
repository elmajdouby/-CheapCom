class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :avatar, :post_avatar]
  after_action :set_authorize, only: [:new, :show, :edit, :update, :destroy, :create, :avatar, :post_avatar]
  before_action :set_gon_update, only: [:avatar]
  skip_before_action :verify_authenticity_token, only: [:avatar, :post_avatar, :create, :new]
  before_action :get_data_type
  before_action :format, only: [:new, :show, :edit, :update, :create, :avatar, :post_avatar]
  # GET /members
  def index
    #********************* Family Tree ***************************
    @members = policy_scope(Member).where(user_id: current_user)
    gon.membersJson = Array.new
    @members.each do |member|
      case member.type.value
        when 'Collaborateur(rice)'
          @Collaborateur = member.id
          gon.membersJson << { id: member.id, img: member.avatar}
        when'Conjoint(e)'
          @conjointid = member.id
          gon.membersJson << { id: member.id, pid: @Collaborateur , img: member.avatar }
        when 'Enfant'
          gon.membersJson << { id: member.id, pid: @conjointid, img: member.avatar }
      end
    end
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    @member.lastname = @member.lastname.upcase
    @member.firstname = @member.firstname.capitalize
    @member.save
  end

  # POST /members
  def create
    @member = Member.new(member_params)
    @member.user = current_user
    # @member.sexe = params[:sexe]
    # @member.avatar = params[:avatar]
    if @member.save
      redirect_to members_path, notice: 'Membre créé avec succès.'
    else
      # render :new
      render :partial => 'new'
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      redirect_to members_path, notice: 'Membre mis à jour avec succès.'
    else
      render :edit
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Membre supprimé avec succès.'
  end

  def post_avatar
    @member.avatar = params[:avatar]
    @member.save
  end

  def avatar
  end

  private

  def format
    respond_to do |format|
      format.html
      format.js
    end
  end

  def set_gon_update
    gon.path = "/members/" + @member.id.to_s + '/avatar'
    gon.action = "post"
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def get_data_type
      @data_type = Type.all
    end
    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:startdate, :enddate, :firstname, :sexe, :lastname, :birthdate, :type_id, :user_id, :avatar)
    end

    def set_authorize
      authorize @member
    end
end
