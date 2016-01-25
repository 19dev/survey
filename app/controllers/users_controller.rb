class UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  def index
    @users = Admin.all
  end
  def show
  	@user = Admin.find(params[:id])
  end

  # GET /polls/new
  def new
    @user = Admin.new
  end

  # GET /polls/1/edit
  def edit

  end

  # POST /polls
  # POST /polls.json
  def create
    @user = Admin.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
 # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Poll was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:admin).permit(:email,:sign_in_count,:password,:password_confirmation)
    end
end


