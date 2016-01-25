class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = Admin.all
  end
  def show
  end

  def new
    @user = Admin.new
  end

  def edit

  end

  def create
    @user = Admin.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'Yönetici eklendi.' }
      else
        format.html { render :new }
      end
    end
  end
  def update

    respond_to do |format|

      if @user.update(user_params)

        format.html { redirect_to admin_users_path, notice: 'Yönetici bilgileri güncellendi.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'Yönetici silindi' }
    end
  end

  private
    def set_user
      @user = Admin.find(params[:id])

    end

    def user_params
      params.require(:admin).permit(:email,:sign_in_count,:password,:password_confirmation)
    end
end
