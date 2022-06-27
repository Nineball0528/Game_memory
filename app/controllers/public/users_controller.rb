class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def confirm
  end

  def withdraw
    @user = current_user
    @user.update(withdrawal_status: true)
    reset_session
    redirect_to root_path
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :self_introduction ,:gender ,:publication_status, :withdrawal_status)
  end

end
