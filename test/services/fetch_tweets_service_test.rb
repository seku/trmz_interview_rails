require 'test_helper'

class FetchTweetsServiceTest < ActiveSupport::TestCase
  test "job performance" do
    Timecop.freeze do
      Setting.create(query: "some", limit: 1, run_at_hour: Time.now.hour, run_at_minute: Time.now.min)
      TwitterServiceJob.any_instance.expects(:perform_later).with("some", 1)
      FetchTweetsService.perform
    end
  end
end
