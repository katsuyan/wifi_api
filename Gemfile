source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'grape-swagger-rails', '~> 0.3.0'
gem 'swagger-docs', '~> 0.2.9'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5.2'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'rails-controller-testing', '1.0.1'
  gem 'pry-rails', '~> 0.3.5'
  gem 'database_cleaner', '~> 1.5.3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker', '~> 1.7.3'
  gem 'capybara', '~> 2.12.1'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 3.3.0'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
