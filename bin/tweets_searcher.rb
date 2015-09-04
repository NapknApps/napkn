require 'rubygems'
require 'tweetstream'
require 'growl'

tracks = 'yankees'
puts "Starting a TweetStream Daemon to track: #{tracks}"

TweetStream.configure do |config|
  config.consumer_key       = "15utLKJXcan5VfBZTfqrnkXdZ"
  config.consumer_secret    = "DE9yeroPiZvM5geqG15e278J93hg7KjKNCp65Dfv5lARTaebwj"
  config.oauth_token        = "3332969963-ZLxPjZK547knNVpXCXtrXVGhvWBORAvfjuiGQoY"
  config.oauth_token_secret = "2FVjXrvXVVx1XCPiRCxTn7Er5gsEBSn3zPkQzdYCsI9qi"
  config.auth_method        = :oauth
end

ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, "config", "environment")

daemon = TweetStream::Daemon.new('tracker', :log_output => true)
daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
  ActiveRecord::Base.logger = Logger.new(File.join(Rails.root, 'log/stream.log'), 'w+')
end
daemon.track('term1') do |tweet|
  AppIdea.create_from_tweet
end
