class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @chatroom = Chatroom.new
  end

  def edit
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'}
      end
    end
  end

  def update
    chatroom = Chatroom.find_by(slug: params[:slug])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    if @chatroom.nil?
      redirect_to( chatrooms_path, :flash => { :danger => "There isn't a chatroom with that name. Select one from the ones below" })
    end
    @message = Message.new
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:topic, :owner_id)
    end
end
