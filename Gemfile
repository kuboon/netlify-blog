source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'sass-rails'
gem 'uglifier'
gem 'therubyracer', platforms: :ruby

gem 'coffee-rails'
gem 'turbolinks'

gem 'jbuilder'
#gem 'sdoc', group: :doc

gem 'passenger'

gem 'haml-rails'
gem 'kaminari'
gem 'action_args'
gem 'classy_enum'

gem "rails-i18n"
gem 'restful_error'

gem 'redcarpet'

group :development do
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'bullet'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "sitespec"
  gem 'pry-byebug'
  gem 'spring'
  gem 'factory_bot_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov'
end

group :test, :home do
  gem 'sqlite3'
end

group :home, :production do
  gem 'rails_12factor'
end
