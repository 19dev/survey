class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    redirect_to home_index_path
  end

  def show
    @question_answers = Question.find(params[:id]).answers
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Soru eklendi.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Soru güncellendi' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to poll_path(@question.poll_id), notice: 'Soru silindi' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find_by_id(params[:id])
      @poll=@question.poll_id
    end

    def question_params
      params.require(:question).permit(:question_header, :question_description, :poll_id, answers_attributes: [:id, :answer_description, :image, :_destroy])
    end
end
