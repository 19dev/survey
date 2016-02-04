class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :passCodeCreator]
  before_action :authenticate_admin!

  def passCodeCreator
    i = 0
    while i < params[:type].to_i
    	a = SecureRandom.hex(50)
    	b = SecureRandom.hex(50)
    	c = a + b
    	d = Digest::MD5.hexdigest(c)
    	e = PassCode.new(:passcode => d[0..9], :pass_code_is_finished => false, :poll_id => @poll.id)
      e.save
    	i += 1
    end
    flash[:notice] = 'Giriş kodları oluşturuldu'
    redirect_to @poll
  end


  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll_passcodes= @poll.pass_codes.paginate(page: params[:page], per_page: 10)
    @poll_questions = Poll.find(params[:id]).questions
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Anket oluşturuldu.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Anket güncellendi.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Anket silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:poll_name, :poll_description, :poll_start_date, :poll_finish_date, questions_attributes: [:id, :question_header, :_destroy])
    end
end
