require 'test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  test "tweets defaults lookup" do
    VCR.use_cassette "twitter-default-search" do
      Twitter::REST::Client.any_instance.unstub(:search)
      service = TwitterService.new(Setting::DEFAULT_QUERY, Setting::DEFAULT_LIMIT)

      assert_difference 'Tweet.count', Setting::DEFAULT_LIMIT do
        service.perform
      end
      assert_equal Setting::DEFAULT_QUERY, Tweet.last.query
    end
  end

  test "twitter error" do
    Twitter::REST::Client.any_instance.stubs(:search).raises(Twitter::Error.new)
    service = TwitterService.new(Setting::DEFAULT_QUERY, Setting::DEFAULT_LIMIT)

    assert_no_difference 'Tweet.count' do
      service.perform
    end
  end
end
