class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def show
    # sign_out :admin
    redirect_to root_path
  end



    def show
    end

    def new
      @admin = Admin.new
    end

    def edit
    end


    def create
      @admin = Admin.new(admin_params)

      respond_to do |format|
        if @admin.save
          format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end


    def update
      respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end


    def destroy
      @admin.destroy
      respond_to do |format|
        format.html { redirect_to administrators_url, notice: 'Admin was successfully destroyed.' }
      end
    end

    private
      def set_admin
        @admin = Admin.find(params[:id])
      end

      def admin_params
        params.require(:admin).permit(:admin_email, :admin_password, :admin_password_confirmation)
      end


end
