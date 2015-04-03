class Admin::UsersController < Admin::BaseController
    # before_action :check_if_admin

    def index
      @users = User.all.page(params[:page]).per(3)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(admin_user_params)
    if @user.save
      SystemMailer.welcome_email(@user).deliver
      redirect_to admin_users_path, notice: "you created, #{@user.firstname}!"
    else
      render :index
    end
  end

    def show

    end

    def edit
        # the code below, is meant more for a show page, how can i impliment on a index page, where the params are looped through and not passed as query string?
        @user = User.find(params[:id])
    end

    def update
      binding.pry
    @user = User.find(params[:id])
    if @user.update_attributes(admin_user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
    end


    protected

  def admin_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end
end
