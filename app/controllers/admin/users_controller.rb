class Admin::UsersController < ApplicationController
    before_action :check_if_admin

    def index
      @users = User.all.page(params[:page]).per(3)
    end

    private

    def check_if_admin 
      return redirect_to movies_path unless current_user
      id = session[:user_id]
      unless User.find(id).admin
        redirect_to movies_path
      end
    end
end
