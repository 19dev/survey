class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def show
    sign_out :admin
    redirect_to root_path
  end
end
