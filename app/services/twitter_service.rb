class TwitterService

  def initialize(query, limit)
    @limit = limit
    @query = query
  end

  def perform
    fetch_recent_tweets
    parse_response
  end

  private

  def fetch_recent_tweets
    begin
      @results = $twitter.search(@query).take(@limit)
    rescue Twitter::Error => error
      #TODO -> Replace with real logging
      Rails.logger.error "Twitter error: #{error.inspect}"
    end
  end

  def parse_response
    return nil unless @results
    @results.map{ |tweet| save(tweet) }
  end

  def save(tweet)
    Tweet.create!(
      message: tweet.text,
      query: @query,
      owner: tweet.user.screen_name,
      owner_avatar_url: tweet.user.profile_image_url,
      tweeted_at: tweet.created_at
    )
  end
end
