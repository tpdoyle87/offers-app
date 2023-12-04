# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'devise'
gem 'devise_token_auth', git: 'git@github.com:single-stop-tony/devise_token_auth.git'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'pry-rails'
gem 'puma', '>= 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.1.2'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.0'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'database_cleaner-active_record'
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'annotate'
  gem 'foreman', '~> 0.87.2'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'web-console'
end
group :test do
  gem 'capybara'
  gem 'rubocop-capybara'
  gem 'rubocop-factory_bot', '~> 2.24'
  gem 'rubocop-rspec', '~> 2.25'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.0'
end
