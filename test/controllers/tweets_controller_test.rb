class TweetsControllerTest < ActionController::TestCase
  test "#index" do
    Tweet.create(query: "some", message: "some", owner: "some", owner_avatar_url: "some", tweeted_at: Time.now)

    get :index

    assert_response :success
    assert_not_nil assigns(:queries)
    assert_not_nil assigns(:tweets)
    assert_select "h2", "Recent Tweets"
    assert_select "a", "Settings"
    assert_select ".table" do
      assert_select "th", "Owner"
      assert_select "th", "Created at"
      assert_select "th", "Message"
      assert_select "th", "Query"
    end
  end
end
