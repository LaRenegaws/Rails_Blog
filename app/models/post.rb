class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	#sets minimum requirements for a post to prevent empty post
	validates :title, presence: true, length: {minimum: 2}
	validates :body, presence: true
end
