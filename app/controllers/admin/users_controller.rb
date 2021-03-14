class Admin::UsersController < Admin::AdminController
  before_action :check_permission, exept: :show
  before_action :load_user, only: %i(edit update)

  def show
    @check = true
    @users = User.all
    @roles = User.roles
  end

  def edit
    @check = false
  @users = User.all
  @roles = User.roles
  render :show
  end

  def update
    @role = params[:role].to_i
    if @user.update(role: @role)
      flash[:success] = t "success"
      redirect_to admin_users_path
    else
    flash[:warning] = t "update fail"
    redirect_to admin_users_path
  end
  end

  private

  def check_permission
    unless current_user.role == Settings.role_admin
      render :show
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :role)
  end
end
