class Admin::UsersController < ApplicationController
    before_action :check_if_admin

    def index
      # binding.pry
      @users = User.all
    end

    private

    def check_if_admin
      id = session[:user_id]
      unless User.find(id).admin
        # !id || !User.find(id).admin?
        redirect_to movies_path 
      end

    end

end
