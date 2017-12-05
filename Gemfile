source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'jquery-rails'
gem 'active_decorator'
gem 'carrierwave'
gem 'mini_magick'
gem 'ckeditor'
gem 'fog'
gem 'devise-bootstrap-views'
gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'pry-rails'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
