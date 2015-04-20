class TwitterServiceJob < ActiveJob::Base
  queue_as :default

  def perform(query, limit)
    TwitterService.new(query, limit).perform
  end
end

