class TopController < ApplicationController
  skip_load_and_authorize_resource
  before_filter :current_user

  def index
  	if user_signed_in?
  		@lecturer = Lecturer.where(:email => current_user.email)
  		# @lecturer.all do |ltr| 
  		# 	@ts = TeachingSchedule.where(:lecturer_id => ltr.id)
  		# end
  	end
  end
end
