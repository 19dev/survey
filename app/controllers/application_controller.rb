class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  protect_from_forgery with: :exception
	def doespollhaverecords(poll_id)
		poll=Poll.find(poll_id)
		a=poll.pass_codes
		a.each do |c|
		d=c.records.count
			if d != 0
				return true
			end
		end
		
	end
	helper_method :doespollhaverecords
end
