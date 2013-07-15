class PostsController < ApplicationController

require 'markov_class'

def index
    @posts = Post.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
end

def create
@post = Post.create(:message => params[:message])
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        flash[:notice] = "Message failed to save."
        format.html { redirect_to posts_path }
      end
    end
end

# def main_object
#     sample_text = open("/lib/markov_class/python_trek.txt").read()
#     @post = TwitterMarkov.new sample_text
#     random_txt = @post.generate()
#     puts random_txt
#     user_tweet(random_txt)
# end

# def user_tweet(random_txt)
#     require "rubygems"
#     require "twitter"
  
#     # Certain methods require authentication. To get your Twitter OAuth credentials,
#     # register an app at http://dev.twitter.com/apps
#     Twitter.configure do |config|
#         config.consumer_key = ENV['TWITTER_KEY']
#         config.consumer_secret = ENV['TWITTER_SECRET']
#         config.oauth_token = ENV['TWITTER_TOKEN'] 
#         config.oauth_token_secret =  ENV['TWITTER_T_SECRET']
#     end
  
#     # Initialize your Twitter client
#     @twitter = Twitter::Client.new
  
#     # Post a status update
#     @twitter.update(random_txt)
#     redirect_to request.referer, :notice => 'Tweet successfully posted'
# end


end
