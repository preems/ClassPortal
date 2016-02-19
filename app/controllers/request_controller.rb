class RequestController < ApplicationController
  def requestenroll
    Request.new(:status=>"pending", :course_id=>params[:course_id], :user_id=> params[:user_id]).save!
    flash[:alert]="Enrollment request sent!"
    redirect_to course_path
  end
end
