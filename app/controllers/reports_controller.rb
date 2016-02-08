class ReportsController < ApplicationController
	 before_action :set_report, only: [:show, :index, :reportpasscode]
	def index

	end

	def show
		@poll=Poll.find(params[:id])
		@poll_passcodes = @poll.pass_codes.paginate(page: params[:page], per_page: 10)
		@questions=@poll.questions
	end

	def reportpasscode
		@pass_code = PassCode.find(params[:id])
		@poll = Poll.find(@pass_code.poll_id)
		@questions = @poll.questions
	end



	private
	    def set_report
	    end

end
