class AdministratorController < ApplicationController

  # TODO: implement edit

  def index
    @users = User.where("role='admin'")
  end

  def new
    @user = User.new
    @action = 'create'
  end

  def create
    @user = User.new(user_params)
    @user.role='admin'
    if @user.save
      flash[:notice]= "New admin created"
      redirect_to url_for( :action => :index)
    else
      flash[:alert]="Failed to create Admin"
      redirect_to url_for( :action => :index)
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice]='Admin was deleted'
      redirect_to url_for( :action => :index)
    else
      flash[:alert]='Admin creation failed'
      redirect_to url_for( :action => :index)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def course_params
    params.require(:course).permit(:number, :title, :desc,:startDate,:endDate,:status)
  end


  def courselist
    @courses = Course.all
  end

  def newcourse
    @course = Course.new
    @action = 'createcourse'
  end

  def createcourse
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]= "New Course created"
      redirect_to url_for( :action => :courselist)
    else
      flash[:alert]="Failed to create Course"
      redirect_to url_for( :action => :courselist)
    end
  end

  def updatecourse
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice]= "Course updated"
      redirect_to url_for( :action => :courselist)
    else
      flash[:alert]="Failed to update Course"
      redirect_to url_for( :action => :courselist)
    end
  end

  def editcourse
    @course = Course.find(params[:id])
    @action = 'updatecourse'
  end

  def deletecourse
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:notice]='Course was deleted'
      redirect_to url_for( :action => :courselist)
    else
      flash[:alert]='Course deletion failed'
      redirect_to url_for( :action => :courselist)
    end
  end

  def instructorlist
    @users=User.where("role='instructor'")
  end

  def studentlist
    @users=User.where("role='student'")
  end

  def newinstructor
    @user = User.new
    @action = 'createinstructor'
  end

  def newstudent
    @user = User.new
    @action = 'createstudent'
  end


  def createinstructor
    @user = User.new(user_params)
    @user.role='instructor'
    if @user.save
      flash[:notice]= "New instructor created"
      redirect_to url_for( :action => :instructorlist)
    else
      flash[:alert]="Failed to create instructor"
      redirect_to url_for( :action => :instructorlist)
    end
  end

  def deleteinstructor
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice]='Instructor was deleted'
      redirect_to url_for( :action => :instructorlist)
    else
      flash[:alert]='Instructor deletion failed'
      redirect_to url_for( :action => :instructorlist)
    end
  end

  def courseinstructor
    @course = Course.find(params[:id])
    @instructors = @course.users.where("role = ?", 'instructor')
  end

  def courseinstructoradd
    @course = Course.find(params[:id])
    @user = User.find_by_email_and_role(params[:email],'instructor')
    if @user.nil?
      flash[:alert]='Instructor was not found'
      redirect_to url_for( :action => :courseinstructor, id: @course)
    else
      @course.users << @user
      flash[:notice]='Instructor was added'
      redirect_to url_for( :action => :courseinstructor, id: @course)
    end
  end

  def courseinstructordelete
    @course = Course.find(params[:courseid])
    @instructor = User.find(params[:instructorid])
    @course.users.delete(@instructor)
    redirect_to url_for( :action => :courseinstructor, id: @course)
  end

  def coursestudent
    @course = Course.find(params[:id])
    @users = @course.users.where("role = ?", 'student')
  end

  def coursestudentadd
    @course = Course.find(params[:id])
    @user = User.find_by_email_and_role(params[:email],'student')
    if @user.nil?
      flash[:alert]='Student was not found'
      redirect_to url_for( :action => :coursestudent, id: @course)
    else
      @course.users << @user
      flash[:notice]='Student was added'
      redirect_to url_for( :action => :coursestudent, id: @course)
    end
  end

  def coursestudentdelete
    @course = Course.find(params[:courseid])
    @user = User.find(params[:studentid])
    @course.users.delete(@user)
    redirect_to url_for( :action => :coursestudent, id: @course)
  end

  def createstudent
    @user = User.new(user_params)
    @user.role='student'
    if @user.save
      flash[:notice]= "New student created"
      redirect_to url_for( :action => :studentlist)
    else
      flash[:alert]="Failed to create student"
      redirect_to url_for( :action => :studentlist)
    end
  end

  def deletestudent
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice]='Student was deleted'
      redirect_to url_for( :action => :studentlist)
    else
      flash[:alert]='Student deletion failed'
      redirect_to url_for( :action => :studentlist)
    end
  end

end
