class UsersController < ApplicationController
  before_action :fetch_user, only: %i[show new edit update destroy]

  def show
  end

  def create
    @user = User.new(user_params)
    #...
  end

  def edit
  end

  def update

  end

  def destroy
    # @user.delete
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :avatar)
  end
end
