require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "#display_time" do
    setting = Setting.new(query: "some", run_at_hour: 12, run_at_minute: 2, limit: 1)

    assert_equal "12:02", display_time(setting)

    setting = Setting.new(query: "some", run_at_hour: 7, run_at_minute: 23, limit: 1)

    assert_equal "7:23", display_time(setting)
  end

  test "#owners_twitter_link_for" do
    tweet = Tweet.new(query: "some", message: "some", owner: "some", owner_avatar_url: "url", tweeted_at: Time.now)

    assert_equal "<a href=\"https://twitter.com/some\"><p>some</p><img src=\"/images/url\" alt=\"Url\" /></a>", owners_twitter_link_for(tweet)
  end
end
