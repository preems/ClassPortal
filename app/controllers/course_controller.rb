class CourseController < ApplicationController

  def index
    if params[:search]
      @course = Course.search(params[:search])
    else
      @course = Course.search("")
    end
  end

  def mycourse
      current_user
      @course = @current_user.courses.where(status:"active")
      @role=@current_user.role
      @heading = "My Courses"
  end

  def coursehistory
    current_user
    @course = @current_user.courses
    @role=@current_user.role
    @heading ="My History"
    render 'course/mycourse'

  end

  def coursepage
    @course = Course.find(params[:id])
    @notifications = Notification.where("course_id="+@course.id.to_s)
    current_user
  end

  def coursenotificationadd
    @course = Course.find(params[:id])
    notif = Notification.new
    notif.message=params[:message]
    notif.course=@course
    notif.save()
    redirect_to url_for( :action => :coursepage, :id=>@course)
  end

  def requests
      @pending=courses_users.count
  end

  def studentcoursedrop
    @course = Course.find(params[:id])
    current_user
    @current_user.courses.delete(@course)
    redirect_to url_for(:action => :mycourse)
  end

end
