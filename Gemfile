source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'rack-attack'
gem 'rack-cors'
gem 'react_on_rails', '11.1.4'
gem 'rest-client'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'rspec-rails', '3.8'
  gem 'rubocop', require: false
  gem 'simplecov', require: false, group: :test
  gem 'sqlite3', '~> 1.3.0'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.4.1'

gem 'mini_racer', platforms: :ruby