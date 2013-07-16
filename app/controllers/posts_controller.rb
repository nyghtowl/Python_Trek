class PostsController < ApplicationController

require 'markov_class'
require "rubygems"
require "twitter"

def create
  @sample_text = open(Rails.root+"lib/markov_class/python_trek.txt").read()
  @tweet = TwitterMarkov.new @sample_text
  random_txt = @tweet.generate()
  print random_txt
  render :json => { :response => user_tweet(random_txt) }
end

def user_tweet(random_txt)
  
    # Twitter authentication
    Twitter.configure do |config|
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        config.oauth_token = ENV['TWITTER_TOKEN'] 
        config.oauth_token_secret =  ENV['TWITTER_T_SECRET']
    end

    # Initialize your Twitter client
    client = Twitter::Client.new
    
    # Post a status update
    print random_txt
    client.update(random_txt)
    # Twitter.update(random_txt)
    return random_txt
    # redirect_to request.referer, :notice => 'Tweet successfully posted'
end


end
