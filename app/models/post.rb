class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 50}
	validates :summary, length: {maximum: 20}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validate :click_bait?

	def click_bait?
		baits = [/Won't Believe/i,/Secret/i, /Top/i, /Guess/i]
	  unless baits.any? {|bait| bait.match title}
			errors.add(:title, "The title must be clickbait.")
		end
	end


end
