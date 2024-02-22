class ChatsController < ApplicationController
	def index
		@chats=Chat.all
		render json: {chats: @chats}
	end
end
