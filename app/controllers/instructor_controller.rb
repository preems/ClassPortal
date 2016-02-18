class InstructorController < ApplicationController

  def index
    @users = User.where("role='instructor'")
  end

end
