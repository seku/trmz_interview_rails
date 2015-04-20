source 'https://rubygems.org'

gem 'rails', '4.2'
gem 'pg'
gem "twitter"
gem "haml"
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'simple_form'
gem 'clockwork'
gem 'delayed_job_active_record'
gem "delayed_job_web"
gem 'uglifier'

group :test do
  gem 'webmock'
  gem 'vcr'
  gem 'mocha'
  gem 'shoulda'
  gem 'timecop'
end

group :development do
  gem "foreman"
end

group :development, :test do
  gem 'dotenv-rails'
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-stack_explorer"
end

group :production do
  gem 'rails_12factor'
end

ruby "2.1.3"
