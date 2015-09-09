class AppIdea < ActiveRecord::Base

	resourcify
	after_create :notify_user

	def self.create_from_tweet(status)
	  create!(
	    tweet: status.text,
	    user_handle: status.user.screen_name,
	    user_approved: true
	  )
  end

	def notify_user
	  client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = '15utLKJXcan5VfBZTfqrnkXdZ'
		  config.consumer_secret     = 'DE9yeroPiZvM5geqG15e278J93hg7KjKNCp65Dfv5lARTaebwj'
		  config.access_token        = '3332969963-ZLxPjZK547knNVpXCXtrXVGhvWBORAvfjuiGQoY'
		  config.access_token_secret = '2FVjXrvXVVx1XCPiRCxTn7Er5gsEBSn3zPkQzdYCsI9qi'
		end

	  client.update("@#{user_handle} great app idea! edit/share/upvote -> www.napkn.io/app_ideas/#{id}/edit")
  end

	def user_voted_for(user)
	  if user.identities.count > 0
	    user.identities.first.nickname == user_handle
	  else
	    false
	  end
  end

end
