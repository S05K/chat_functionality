class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  # after_create :brodcast


  # def brodcast
  #   byebug
  #     ActionCable.server.broadcast "chat_#{self.chat_id}",message: self.content
  # end
end
