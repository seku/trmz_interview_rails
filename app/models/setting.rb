class Setting < ActiveRecord::Base
  DEFAULT_QUERY = "ukraine conflict"
  DEFAULT_LIMIT = 50
  RUN_HOUR_MIN = 0
  RUN_HOUR_MAX = 23
  RUN_MINUTES_MIN = 0
  RUN_MINUTES_MAX = 59

  validates :run_at_hour, :run_at_minute, :query, :limit, presence: true
  validates :run_at_hour, numericality: {only_integer: true, greater_than_or_equal_to: RUN_HOUR_MIN, less_than_or_equal_to: RUN_HOUR_MAX}
  validates :run_at_minute, numericality: {only_integer: true, greater_than_or_equal_to: RUN_MINUTES_MIN, less_than_or_equal_to: RUN_MINUTES_MAX}
  validates :query, uniqueness: { scope: [:run_at_hour, :run_at_minute], message: "query for given time already exists" }

  before_validation :set_query
  before_validation :set_limit

  private

  def set_query
    self.query = query.present? ? query : DEFAULT_QUERY
  end

  def set_limit
    self.limit = limit.present? ? limit : DEFAULT_LIMIT
  end
end
