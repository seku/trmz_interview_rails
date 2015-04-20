require 'test_helper'

class TwitterServiceJobTest < ActiveJob::TestCase
  test "job performance" do
    TwitterService.any_instance.expects(:perform)
    TwitterServiceJob.perform_later
  end
end
