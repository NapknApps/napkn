require 'rubygems'
require 'tweetstream'

ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, "config", "environment")

daemon = TweetStream::Daemon.new('tracker', :log_output => true)

daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
  daemon_logger = ActiveSupport::Logger.new(File.join(Rails.root, "log", "daemon.log"))
  Rails.logger = ActiveRecord::Base.logger = daemon_logger
end
daemon.track("@justinbieber") do |tweet|
  p tweet.text
  daemon_logger = ActiveSupport::Logger.new(File.join(Rails.root, "log", "daemon.log"))
  Rails.logger = ActiveRecord::Base.logger = daemon_logger
  Rails.logger.log tweet.text
end