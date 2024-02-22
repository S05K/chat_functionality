class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:id]}"
  end

  def unsubscribed
    stop_all_streams
  end


def speak(data)
    message = Message.create!(user_id: data['user_id'], chat_id: params[:id], content: data['message'])
    if message.save
      ActionCable.server.broadcast "chat_#{params[:id]}", {message: data['message']}
    end
end







end
