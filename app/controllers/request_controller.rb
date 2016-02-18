class RequestController < ApplicationController
  def show
    @pending=Request.all
  end
end
