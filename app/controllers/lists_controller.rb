class ListsController < ApplicationController
  before_filter :initialize_twitter

  def index
    @lists = @twitter.lists
    @users = @twitter.friend_ids.ids.in_groups_of(100, false).map { |group| @twitter.users(group) }.flatten 
  end
end
