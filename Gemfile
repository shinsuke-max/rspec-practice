source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',         '5.1.6'
gem 'puma',          '~> 3.7'
gem 'sass-rails',    '~> 5.0'
gem 'uglifier',      '>= 1.3.0'
gem 'coffee-rails',  '~> 4.2'
gem 'turbolinks',    '~> 5'
gem 'jbuilder',      '~> 2.5'

group :development, :test do
  gem 'sqlite3',           '1.3.13'
  gem 'rspec-rails',       '~> 3.6.0'
  gem "factory_bot_rails", '~> 4.10.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver'
end

group :development do
  gem 'spring-commands-rspec'
  gem 'web-console', '>= 3.3.0'
  gem 'listen',      '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker', require: false # for sample data in development
end

group :test do
  gem 'capybara', '~> 2.13.0'
  gem 'webdrivers'
  gem 'launchy', '~> 2.4.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'devise'
gem 'paperclip'
gem 'geocoder'
