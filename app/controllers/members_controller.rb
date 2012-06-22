class MembersController < ApplicationController
  before_filter :initialize_twitter

  respond_to :json

  def index
    @members = @twitter.list_members(params[:list_id].to_i).users
    respond_with(@members)
  end

  def create
    @twitter.list_add_member(params[:list_id].to_i, params[:id].to_i)
    render :json => {:successful => true}
  end

  def destroy
    @twitter.list_remove_member(params[:list_id].to_i, params[:id].to_i)
    render :json => {:successful => true}
  end
end
