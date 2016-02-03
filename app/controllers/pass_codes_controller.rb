class PassCodesController < ApplicationController
  before_action :set_pass_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @pass_codes = PassCode.all
  end

  def show
  end

  def new
    @pass_code = PassCode.new
  end

  def edit
  end


  def create
    @pass_code = PassCode.new(pass_code_params)

    respond_to do |format|
      if @pass_code.save
        format.html { redirect_to @pass_code, notice: 'Pass code was successfully created.' }
        format.json { render :show, status: :created, location: @pass_code }
      else
        format.html { render :new }
        format.json { render json: @pass_code.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @pass_code.update(pass_code_params)
        format.html { redirect_to @pass_code, notice: 'Pass code was successfully updated.' }
        format.json { render :show, status: :ok, location: @pass_code }
      else
        format.html { render :edit }
        format.json { render json: @pass_code.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pass_code.destroy
    respond_to do |format|
      format.html { redirect_to pass_codes_url, notice: 'Pass code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pass_code
      @pass_code = PassCode.find(params[:id])
    end

    def pass_code_params
      params.require(:pass_code).permit(:passcode, :poll_id, :pass_code_is_finished)
    end
end
