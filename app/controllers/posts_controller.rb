class PostsController < ApplicationController

require 'markov_class' # Connects to TwitterMarkov class in lib
require "rubygems"
require "twitter"

# Initialized when Tweet button pushed and referenced in routes
def create
  # Generates sample text from Monty Python & Star Trek raw text file
  @sample_text = open(Rails.root+"lib/markov_class/python_trek.txt").read()

  # Creates an instance of hashes with python and trek words
  @tweet = TwitterMarkov.new @sample_text

  # Builds random tweet
  random_txt = @tweet.generate()

  # Returns random tweet in CLI and posts @pythontrek
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

    return random_txt
    # redirect_to request.referer, :notice => 'Tweet successfully posted'
end


end
