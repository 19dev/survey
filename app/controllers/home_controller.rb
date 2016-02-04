class HomeController < ApplicationController
	  before_action :set_home, only: [:survey]
	def  survey
	
			@poll = Poll.find(@pid)	
			@poll_questions = @poll.questions.all.paginate(page: params[:page], per_page: 1)
		
	end
  private
    def set_home
    	if PassCode.find_by_passcode(params["passcod"])
      		@pid=PassCode.find_by_passcode(params["passcod"]).poll_id
      	else
			flash[:notice]="Yanlış giriş kodu girdiniz"
			redirect_to home_index_path
		end
    end
end
