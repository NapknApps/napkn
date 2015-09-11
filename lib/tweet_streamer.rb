root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, 'config', 'environment')

log = File.join(root, 'log', 'stream.log')

TweetStream.configure do |conf|
  conf.consumer_key        = '15utLKJXcan5VfBZTfqrnkXdZ'
  conf.consumer_secret     = 'DE9yeroPiZvM5geqG15e278J93hg7KjKNCp65Dfv5lARTaebwj'
  conf.oauth_token         = '3332969963-ZLxPjZK547knNVpXCXtrXVGhvWBORAvfjuiGQoY'
  conf.oauth_token_secret  = '2FVjXrvXVVx1XCPiRCxTn7Er5gsEBSn3zPkQzdYCsI9qi'
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
