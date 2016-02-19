class InstructorController < ApplicationController

  def index
    @users = User.where("role='instructor'")
  end

  def requests
    current_user
    @cids =@current_user.courses
    @c = @cids.map {  |i| i.id }
    @pending = Request.all
    @pending = @pending.select{ |i| i.course_id.in?(@c) }
  end

  def enroll
    a=params[:user_id]
    b=params[:course_id]
    one=User.find(a)
    two=Course.find(b)
    one.courses << two
    Request.where(course_id:b,user_id:a).first.destroy
    redirect_to requests_path
  end

  def requestinactive
    @course= Course.find(params[:id])
    @course.update_attribute(:inactive,1)
    redirect_to mycourses_path
  end
end
