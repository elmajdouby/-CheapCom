class UsersController < ApplicationController
  after_action :set_authorize, only: [:index]

  def index
    @users = policy_scope(User)
  end

private

  def set_authorize
    authorize @users
  end
end
