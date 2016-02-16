class HomeController < ApplicationController
	  before_action :set_home, only: [:survey, :record]
	def survey

			if @pass_code.blank?
				flash[:notice]="Hatalı giriş kodu kullandınız !"
				redirect_to home_index_path and return

			else

				if @pass_code.pass_code_is_finished
					flash[:notice]="Bu giriş kodu daha önce kullanıldı !"
					redirect_to home_index_path and return
				end
				if DateTime.now < @pass_code.poll.poll_start_date
					flash[:notice]="Bu anket daha başlamadı !"
					redirect_to home_index_path and return
				elsif DateTime.now > @pass_code.poll.poll_finish_date
					flash[:notice]="Bu anketin süresi doldu !"
					redirect_to home_index_path and return
				end
				@poll = Poll.find(@pid)
				@poll_questions = @poll.questions.all.paginate(page: params[:page], per_page: 1)

			end


	end

	def survey_entrance
	end
	
	def record
		@idler = params[:idler][1..-2]
		@idler = @idler.split(",").map(&:to_i)
		@idler.each do |id|
			Record.create(:pass_code_id => @pass_code_id, :answer_id => id)
		end
		pass_code = PassCode.find(@pass_code_id)
		pass_code.pass_code_is_finished = true
		pass_code.save
		flash[:notice]="Anket cevaplarınız kaydedildi."
		redirect_to home_index_path
	end

  private
    def set_home
			if PassCode.where(passcode: params["passcod"]).size != 0
	    	if PassCode.find_by_passcode(params["passcod"])
					@pass_code_id = PassCode.find_by_passcode(params["passcod"]).id
					@pass_code = PassCode.find(@pass_code_id)
	      	@pid=PassCode.find(@pass_code_id).poll_id
				end
			end
    end

end
