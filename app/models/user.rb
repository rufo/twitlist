class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def twitter_client
    Twitter::Client.new(:oauth_token => access_token,
                        :oauth_token_secret => access_secret)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
      user.access_token = auth["credentials"]["token"]
      user.access_secret = auth["credentials"]["secret"]
    end
  end
end
