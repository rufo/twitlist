class ListsController < ApplicationController
  before_filter :initialize_twitter

  def index
    @lists = @twitter.lists
  end

protected
  def initialize_twitter
    @twitter = Twitter::Client.new(:oauth_token => current_user.access_token,
                                   :oauth_token_secret => current_user.access_secret)
  end
end
