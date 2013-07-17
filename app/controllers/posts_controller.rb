require 'tweet'

class PostsController < ApplicationController

  # Initialized when Tweet button pushed and referenced in routes
  def create

    # Builds random tweet
    random_txt = MARKOV_MODEL.generate()

    # Returns random tweet in CLI and posts @pythontrek
    print random_txt
    render :json => { :response => Tweet.send_tweet(random_txt) }
  end


end
