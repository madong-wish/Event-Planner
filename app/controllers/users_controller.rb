class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find_by_username(params[:username])
  end

  def create
    respond_with User.create(params[:user])
  end

  def update
    respond_with User.update(params[:id], params[:user])
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

  # def username_exist
  #   respond_with User.exists?(params[:username])
  # end
  #
  # def email_exist
  #   respond_with User.exists?(params[:email])
  # end
end
