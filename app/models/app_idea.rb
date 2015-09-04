class AppIdea < ActiveRecord::Base

	def create_from_tweet
    logger.debug "Should be creating an AppIdea."
	  AppIdea.create!(
	    tweet: 'example'
	  )
  end

end
