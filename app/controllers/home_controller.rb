class HomeController < ApplicationController
	  before_action :set_home, only: [:survey]
	def  survey
		@poll = Poll.find(@pid)	
		@poll_questions = @poll.questions.all.paginate(page: params[:page], per_page: 1)
	end
  private
    def set_home
      @pid=PassCode.find_by_passcode(params["passcod"]).poll_id
    end
end
