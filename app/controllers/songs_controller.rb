class SongsController < ApplicationController
	def index
		@songs = Song.order(created_at: :desc)
		@user = current_user
	end

	def create
		song = Song.new(song_params)
		flash[:errors] = song.errors.full_messages unless song.save
		redirect_to "/songs"
	end

	def show
		@song = Song.find(params[:id])
		@listeners = @song.listeners
	end

	private

	def song_params
		params.require(:song).permit(:title, :artist)
	end
end
