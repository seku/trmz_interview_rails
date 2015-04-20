module ApplicationHelper

  def display_time(setting)
    minutes = setting.run_at_minute.to_s.size == 1 ? "0#{setting.run_at_minute}" : setting.run_at_minute
    "#{setting.run_at_hour}:#{minutes}"
  end

  def owners_twitter_link_for(tweet)
    link_to "https://twitter.com/#{tweet.owner}" do
      content_tag(:p, tweet.owner).concat(
        image_tag(tweet.owner_avatar_url)
      )
    end
  end
end
