require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  should validate_presence_of(:query)
  should validate_presence_of(:owner)
  should validate_presence_of(:owner_avatar_url)
  should validate_presence_of(:message)
  should validate_presence_of(:tweeted_at)
end
