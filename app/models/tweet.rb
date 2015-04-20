class Tweet < ActiveRecord::Base
  validates :message, :query, :owner, :owner_avatar_url, :tweeted_at, presence: true
end
