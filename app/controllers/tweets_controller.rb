class TweetsController < ApplicationController

  def index
    @queries = Setting.pluck(:query).uniq
    @tweets = Tweet.where(nil)
    if params[:query]
      @query = params[:query]
      @tweets = @tweets.where(query: params[:query])
    end
    @tweets = @tweets.order("tweeted_at desc").page(params.fetch(:page, 1))
  end
end
