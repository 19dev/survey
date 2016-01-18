class PassCodesController < ApplicationController
  before_action :set_pass_code, only: [:show, :edit, :update, :destroy]

  # GET /pass_codes
  # GET /pass_codes.json
  def index
    @pass_codes = PassCode.all
  end

  # GET /pass_codes/1
  # GET /pass_codes/1.json
  def show
  end

  # GET /pass_codes/new
  def new
    @pass_code = PassCode.new
  end

  # GET /pass_codes/1/edit
  def edit
  end

  # POST /pass_codes
  # POST /pass_codes.json
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

  # PATCH/PUT /pass_codes/1
  # PATCH/PUT /pass_codes/1.json
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

  # DELETE /pass_codes/1
  # DELETE /pass_codes/1.json
  def destroy
    @pass_code.destroy
    respond_to do |format|
      format.html { redirect_to pass_codes_url, notice: 'Pass code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pass_code
      @pass_code = PassCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pass_code_params
      params.require(:pass_code).permit(:passcode, :poll_id, :pass_code_is_finished)
    end
end
