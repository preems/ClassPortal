class StudentController < ApplicationController

def index
  @users = User.where("role='student'")
end
end
