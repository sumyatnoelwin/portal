class TopController < ApplicationController

  before_filter :current_lecturer

  def index
  	if lecturer_signed_in?
  		@lecturer = Lecturer.where(:email => current_lecturer.email)
  		# @lecturer.all do |ltr| 
  		# 	@ts = TeachingSchedule.where(:lecturer_id => ltr.id)
  		# end
  	end
  end
end
