class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    redirect_to home_index_path
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question_path), notice: 'Answer was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_path(@question), notice: 'Answer was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end


  def destroy

    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@answer.question_id), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
      @question=@answer.question_id
    end

    def answer_params
      params.require(:answer).permit(:question_id, :answer_description, :img)
    end
end
