source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'figaro'
# gem 'unicorn'
group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'debugger2', git: 'git://github.com/ko1/debugger2.git'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :production do
  gem 'rails_12factor'
  gem 'pg', '~> 0.18'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'devise'
gem 'simple_form'
# gem 'bootstrap', '~> 4.0.0.alpha6'
gem "twitter-bootstrap-rails"
gem 'toastr-rails'
gem 'ckeditor'
gem "paperclip"

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end