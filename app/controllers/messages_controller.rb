class MessagesController < ApplicationController
	def index 
		# @messages = Message.all
		@messages = Message.includes(:user, :chat).all
		render json: {messages: @messages}, include: [:user, :chat]
	end


#for chat model
	def show
		@chat= Chat.find_by(params[:id])
		render json: @chat.messages
	end


	
end
