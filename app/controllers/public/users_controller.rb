class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def withdrawalcon

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to current_users_show_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :self_introduction ,:gender ,:publication_status, :withdrawal_status)
  end

end
