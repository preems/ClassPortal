class CourseController < ApplicationController

  def index
    if params[:search]
      @course = Course.search(params[:search])
    else
      @course = Course.search("zzz")
    end
  end

def mycourse
    current_user
    @course = @current_user.courses
end

def requests

    @pending=courses_users.count
end

end
