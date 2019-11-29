# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update, :grant]
  before_action :set_user, only: [:edit]
  # skip_before_action :verify_authenticity_token, only: [:base64_avatar]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  def edit
    @qr_string = base64_qrcode(
                              current_user.username + '/' +
                              # current_user.telephonenumber + '/' +
                              # current_user.post + '/' +
                              current_user.email
                              )
    @user.qrcode = @qr_string
    @user.save
  end

  def grant
    @user = User.find(params[:id])
    @user.role = params[:role]
    @user.save
    redirect_to users_path
  end

  # def base64_avatar
  #   @user.avatar = params[:avatar]
  #   @user.save
  #   # redirect_to edit_user_registration(params[:id])
  # end

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

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def base64_qrcode(content)
    qrcode = RQRCode::QRCode.new(content)
    qrcode.as_png(resize_exactly_to: 100).to_data_url
  end

  def png_qrcode
    qr = RQRCode::QRCode.new('ESSEBTI Mohamed Amine')
    ChunkyPNG::Image.from_datastream(qr.as_png.resize(100, 100).to_datastream).to_data_url
  end

  def base64_barcode
    barcode = Barby::Code128.new('123456789A').to_image
    ChunkyPNG::Image.from_datastream(barcode.resize(200, 50).to_datastream).to_data_url
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    added_attrs = [ :username, :role, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude, :category, :subsidiary]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    added_attrs = [:username, :role, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude, :category, :subsidiary]
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
