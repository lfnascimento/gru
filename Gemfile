source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jquery-rails' , '~> 4.3.1'

gem 'slim-rails', '~> 3.1.3'
gem 'bootstrap', '~> 4.1.2'
gem 'simple_form', '~> 3.5.0'
gem 'responders', '~> 2.4.0'
gem 'devise', '~> 4.5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails', '4.11.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 5.7.2'
  gem 'rubocop', '~> 0.52.1' , require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', require: false
  gem 'cucumber-rails' , '~> 1.5.0' , require: false
  gem 'simplecov' , '0.14.1' , require: false
end

group :production do
  gem 'pg', '~> 0.18.4'
  gem 'rails_12factor', '~> 0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
