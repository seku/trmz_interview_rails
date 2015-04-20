unless Rails.env.development?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
  end
end
