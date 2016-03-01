class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json

  def assignPassCode
    @poll_id = params[:poll_id]
    @person_id = params[:person_id]
    @pass_codes = PassCode.where(poll_id: @poll_id, person_id: nil)

    if @pass_codes.size != 0
      @pass_code = @pass_codes.first
      @pass_code.person_id = @person_id
      @pass_code.save
      flash[:notice]="Giriş kodu ataması başarıyla yapıldı"
          redirect_to person_path(@person_id) and return

    else
      flash[:notice]="Atanabilecek giriş kodu bulunamadı. Lütfen anket için yeni kod üretin !"
          redirect_to person_path(@person_id) and return      
    end
  end

  def removePassCodeFromPerson
    @pass_code_id = params[:pass_code_id]
    @person_id = params[:person_id]
    @pass_code = PassCode.find(@pass_code_id)
    @pass_code.person_id = nil
    @pass_code.save
    flash[:notice]="Bir atama başarıyla kaldırıldı !"
          redirect_to person_path(@person_id) and return 
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
        params.require(:person).permit(:person_first_name,:person_last_name,:person_birthday)
    end
end
