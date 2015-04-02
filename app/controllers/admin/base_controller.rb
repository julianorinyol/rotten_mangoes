class Admin::BaseController < ApplicationController
  before_action :admin_check?
  
  private
  def admin_check?
    unless current_user && current_user.admin
      redirect_to movies_path
    end
  end
end