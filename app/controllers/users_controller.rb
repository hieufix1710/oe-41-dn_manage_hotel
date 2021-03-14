# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("created_success")
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    params[:user] = current_user
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation,
                                 :address, :id_card,
                                 :birthday
  end
end
