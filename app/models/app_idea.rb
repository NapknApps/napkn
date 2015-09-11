class AppIdea < ActiveRecord::Base

	resourcify
	after_create :notify_user

	has_many :app_idea_upvotes

	def self.create_from_tweet(status)

		create = true
		if status.retweeted_status
			create = false
		end
		if status.user.screen_name == "NapknApps"
			create = false
		end

		if create
		  create!(
		    tweet: status.text,
		    user_handle: status.user.screen_name,
		    user_approved: true
		  )
		end
  end

	def notify_user
	  client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
		  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
		  config.access_token        = ENV['TWITTER_OAUTH_TOKEN']
		  config.access_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
		end

	  client.update("@#{user_handle} great app idea! edit/share/upvote -> www.napkn.io/app_ideas/#{id}/")
  end

	def user_voted_for(user)
		voted_for = false
    app_idea_upvotes.each do |app_idea_upvote|
      if app_idea_upvote.user_id == user.id
        voted_for = true
      end
    end
    voted_for
  end

	def user_submitted(user)
		submitted = false
	  if user.identities.count > 0
	    if user.identities.first.nickname == user_handle
	    	submitted = true
	    end
	  end
    submitted
  end

	def user_effectively_voted_for(user)
		voted_for = false
		if user_voted_for(user)
			voted_for = true
		end
		if user_submitted(user)
			voted_for = true
		end
		voted_for
	end

  def user_app_idea_upvote(user)
    app_idea_upvotes.each do |app_idea_upvote|
      if app_idea_upvote.user_id == user.id
        return app_idea_upvote
      end
    end
  end

	def upvote_count
		app_idea_upvotes.count + 1
  end

end
