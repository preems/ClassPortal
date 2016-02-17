class SessionController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.role=='superadmin'
        user=@current_user
        redirect_to administrator_path
      elsif user.role == 'admin'
        redirect_to administrator_path
      elsif user.role == 'instructor'
        redirect_to instructor_path
      else
        redirect_to user
      end
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
