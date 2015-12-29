class Post < ActiveRecord::Base
	#sets minimum requirements for a post
	validates :title, presence: true, length: {minimum: 2}
	validates :body, presence: true
end
