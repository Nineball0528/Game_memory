class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def edit
  end

end