root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, 'config', 'environment')

log = File.join(root, 'log', 'stream.log')

TweetStream.configure do |conf|
  conf.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  conf.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  conf.oauth_token         = ENV['TWITTER_OAUTH_TOKEN']
  conf.oauth_token_secret  = ENV['TWITTER_OAUTH_TOKEN_SECRET']
  conf.auth_method         = :oauth
end

daemon = TweetStream::Daemon.new('tweet_streamer', log_output: true)
daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
  ActiveRecord::Base.logger = Logger.new(File.open(log, 'a'))
end
daemon.track('napknappidea') do |status|
  ::AppIdea.create_from_tweet(status)
end
