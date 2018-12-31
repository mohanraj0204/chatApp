class MessagesController < ApplicationController
   before_action :require_user

    def create
     @message = Message.new(message_params)
     @message.user = current_user
     if @message.save
       ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message), user: @message.user.username
     else
       redirect_to root_path
     end
   end

    private

    def message_params
     params.require(:message).permit(:body)
    end

    def render_message(message)
      render(partial: 'message', locals: { message: message } )
    end

  end
