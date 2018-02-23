class ListenersController < ApplicationController
	def create
		@user = current_user
		@song = Song.find(params[:song_id])
		@song.increment!(:adds, by = 1)
		@listener = Listener.find_by(user: @user, song: @song)
		unless @listener
			Listener.create(user: @user, song: @song, adds: 1)
		else
			@listener.increment!(:adds, by = 1)
		end
		redirect_to "/users/#{@user.id}"
	end
end
