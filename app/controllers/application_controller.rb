class ApplicationController < ActionController::Base
  require 'chunky_png'
  require 'rqrcode'
  require 'barby'
  require 'barby/barcode/code_39'
  require 'barby/outputter/png_outputter'
  require "barby/barcode/code_128"

  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # after_action :verify_authorized
  # after_action :verify_authorized, except: :index
  before_action :set_user_details
  before_action :verify_ip_adress
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def set_user_details
    @memberDetails = policy_scope(Member).where(user_id: current_user, type_id: (Type.where(value: 'Collaborateur(rice)')))
    @memberDetails.each do |mem|
      @userDetails = mem
    end
  end
  def verify_ip_adress
    if request.remote_ip == '10.22%' 
       flash[:alert] = "You are not authorized to perform this action."
    end
  end
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :fistname, :lastname, :avatar, :role, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
