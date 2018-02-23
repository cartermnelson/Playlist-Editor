class Song < ActiveRecord::Base
	has_many :listeners
	has_many :users, through: :listeners

	validates :title, :artist, presence: true, length: { minimum: 2 }

	before_save :default_values
	def default_values
		self.adds ||= 0
	end
end
