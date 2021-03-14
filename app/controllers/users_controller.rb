# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user
  before_action :check_edit, only: %i(profile update)

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

  def update
    if @user.update(user_params)
      @check = true
      flash.now[:success] = t "update_success"
      render :show
    else
      flash.now[:warning] = t "wrong_information"
      @check = false
      render :show
    end
  end

  def edit
    render :show
  end

  def show; end

  private

  def load_user
    @user = current_user
  end

  def check_edit
    @check = true
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation,
                                 :address, :id_card,
                                 :birthday
  end
end
