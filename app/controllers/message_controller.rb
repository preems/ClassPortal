class MessageController < ApplicationController
  def index
    current_user
    uid = @current_user.id

    @contacts = User.all

  end

  def chatwindow
    current_user
    @names=Hash.new
    @names[params[:id].to_i] = User.find(params[:id]).name
    @names[@current_user.id]=@current_user.name
    @messages = Message.where(to:params[:id],from:@current_user.id)#.or.where(from:params[:id],to:@current_user.id)
    @messages1=Message.where(from:params[:id],to:@current_user.id)
    @messages = @messages | @messages1
    @messages.sort! {|a,b| a.created_at <=> b.created_at}
  end

  def chatwindowsend
    current_user
    m=Message.new()
    m.to=params[:id]
    m.from = @current_user.id
    m.text=params[:message]
    m.save
    redirect_to url_for(:action => :chatwindow, id:params[:id])
  end



end
