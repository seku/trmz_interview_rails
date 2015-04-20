class SettingsControllerTest < ActionController::TestCase
  test "#index" do
    Setting.create(query: "some", run_at_hour: 12, run_at_minute: 12, limit: 1)

    get :index

    assert_response :success
    assert_not_nil assigns(:settings)
    assert_select "h2", "Schedule for scrapers"
    assert_select "a", "New"
    assert_select "table" do
      assert_select "th", "Query"
      assert_select "th", "Run at (hour:minutes)"
      assert_select "th", "Limit of tweets"
      assert_select "th", "Remove"
    end
    assert_select "a", "Back to recent tweets"
  end

  test "#create - success" do
    assert_difference 'Setting.count', 1 do
      post :create, setting: {query: 'Some', run_at_hour: 12, run_at_minute: 12, limit: 10}
    end
    assert_redirected_to settings_path
  end

  test "#create - failure" do
    assert_no_difference 'Setting.count' do
      post :create, setting: {query: 'Some', run_at_hour: nil, run_at_minute: 12, limit: 10}
    end
    assert_template :new
  end

  test "#destroy" do
    setting = Setting.create(query: 'Some', run_at_hour: 12, run_at_minute: 12, limit: 10)
    assert_difference 'Setting.count', -1 do
      post :destroy, id: setting.id
    end
    assert_nil Setting.find_by(id: setting.id)
  end
end
