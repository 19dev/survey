class ReportsController < ApplicationController
	 before_action :set_report, only: [:show, :index, :reportpasscode]
	def index
		
	end
	def show
		@poll=Poll.find(params[:id])
	end
	def reportpasscode
	end
	private
	    def set_report
	    end

end
