class SessionsController < ApplicationController

      def new
      end

      def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
        else
          flash.now[:alert] = "Log in failed..."
          render :new
        end
      end

      def show
        
        # if params[:format]
        #   user = User.find(params[:format])
        #   session[:user_id] = user.id
        #   redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
        # end
        if current_user.admin 
          user = User.find(params[:format])
          session[:acting_as] = user.id
          redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"

        end
      end

      def destroy
        
        if session[:acting_as]
          session[:acting_as] = nil

          redirect_to admin_users_path
        else
          session[:user_id] = nil
          redirect_to movies_path, notice: "Adios!"
        end
      end
end
