class CourseController < ApplicationController

  def index
    if params[:search]
      @course = Course.search(params[:search])
    else
      @course = Course.search("zzz")
    end
  end
end
