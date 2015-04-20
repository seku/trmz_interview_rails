require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  should validate_presence_of(:run_at_hour)
  should validate_presence_of(:run_at_minute)
  should validate_numericality_of(:run_at_hour).only_integer.is_greater_than_or_equal_to(Setting::RUN_HOUR_MIN).is_less_than_or_equal_to(Setting::RUN_HOUR_MAX)
  should validate_numericality_of(:run_at_minute).only_integer.is_greater_than_or_equal_to(Setting::RUN_MINUTES_MIN).is_less_than_or_equal_to(Setting::RUN_MINUTES_MAX)
  should validate_uniqueness_of(:query).scoped_to(:run_at_hour, :run_at_minute).with_message("query for given time already exists")

  test "#set_query" do
    setting = Setting.new(query: nil, run_at_hour: Setting::RUN_HOUR_MAX, run_at_minute: Setting::RUN_MINUTES_MAX)
    setting.save

    assert_equal Setting::DEFAULT_QUERY, setting.query
  end

  test "#set_limit" do
    setting = Setting.new(query: "some", limit: nil, run_at_hour: Setting::RUN_HOUR_MAX, run_at_minute: Setting::RUN_MINUTES_MAX)
    setting.save

    assert_equal Setting::DEFAULT_LIMIT, setting.limit
  end
end
