# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  def edit
    @user = User.find(current_user.id)
    unless @user.latitude.nil? && @user.longitude.nil?
      @markers = [@user].map do |cordinate|
        {
          lng: cordinate.longitude,
          lat: cordinate.latitude,
          infoWindow: { content: render_to_string(partial: "/shared/info_windows", locals: { cordinate: cordinate }) }
        }
      end
    end
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    added_attrs = [:username, :fistname, :lastname, :avatar, :role, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    added_attrs = [:username, :fistname, :lastname, :avatar, :role, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
