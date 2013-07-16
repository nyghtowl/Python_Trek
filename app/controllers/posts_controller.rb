class PostsController < ApplicationController

require 'markov_class'


def create
  @sample_text = open(Rails.root+"lib/markov_class/python_trek.txt").read()
  @tweet = TwitterMarkov.new @sample_text
  random_txt = @tweet.generate()
  print random_txt
  render :json => { :response => user_tweet(random_txt) }
end

def user_tweet(random_txt)
    require "rubygems"
    require "twitter"
  
    # Certain methods require authentication. To get your Twitter OAuth credentials,
    # register an app at http://dev.twitter.com/apps
    Twitter.configure do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.oauth_token = ENV['TWITTER_TOKEN'] 
        config.oauth_token_secret =  ENV['TWITTER_T_SECRET']
    end
  
    # Initialize your Twitter client
    @twitter = Twitter::Client.new
  
    # Post a status update
    # @twitter.update(random_txt)
    print random_txt
    print 'hit controller post'
    return random_txt
    # redirect_to request.referer, :notice => 'Tweet successfully posted'
end


end
