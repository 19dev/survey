class HomeController < ApplicationController
	  before_action :set_home, only: [:survey, :record]
	def survey
			@poll = Poll.find(@pid)
			@poll_questions = @poll.questions.all.paginate(page: params[:page], per_page: 1)

	end

	def record
		@idler = params[:idler][1..-2]
		@idler = @idler.split(",").map(&:to_i)
		@idler.each do |id|
			Record.create(:pass_code_id => @pass_code_id, :answer_id => id)
		end
		flash[:notice]="Anket cevaplarınız kaydedildi."
		redirect_to home_index_path
	end

  private
    def set_home
    	if PassCode.find_by_passcode(params["passcod"])
				@pass_code_id = PassCode.find_by_passcode(params["passcod"]).id
      	@pid=PassCode.find(@pass_code_id).poll_id
      # else
			# 	flash[:notice]="Yanlış giriş kodu girdiniz"
			# 	redirect_to home_index_path
			end
    end
end
