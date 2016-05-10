class MessagesController < ApplicationController
  include ActionView::Helpers::DateHelper
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username,
        avatar: message.user.avatar.url(:thumb),
        current_user: current_user.username === message.user.username,
        time_ago: time_ago_in_words(message.created_at, include_seconds: true)
      head :ok
    end
  end
  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
