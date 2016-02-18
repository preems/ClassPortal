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

    #@joined =Request.joins(:user).where
  end


  def enroll
    a.courses << b
    #@byebye= Request.find_by course_id: b.course_id and user_id: a.user_id
    #@byebye.destroy
  end
end
