class FetchTweetsService

  def self.perform
    current_time = Time.now
    Setting.where(run_at_hour: current_time.hour, run_at_minute: current_time.min).each do |setting|
      TwitterServiceJob.perform_later(setting.query, setting.limit)
    end
  end
end
