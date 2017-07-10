source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# A Ruby gem to load environment variables from `.env`.
gem 'dotenv-rails'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap-sass', '~> 3.3.6'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker', '~> 1.6', '>= 1.6.3'
# A gem to automate using jQuery with Rails
gem 'jquery-rails'
# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave', '~> 1.1.0'
# Ruby cloud services library
gem 'fog'
# Facebook OAuth2 Strategy for OmniAuth
gem 'omniauth-facebook'
# Gemification of rails's country_select
gem 'country_select'
# ll sorts of useful information about every country packaged as convenient little country objects. It includes data from ISO 3166 (countries and states/subdivisions ), ISO 4217 (currency), and E.164 (phone numbers).
gem 'countries'
# Create beautiful JavaScript charts with one line of Ruby
gem 'chartkick'
# The simplest way to group temporal data
gem 'groupdate'
# Braintree Ruby library
gem 'braintree', '~> 2.76.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # A fixtures replacement with a straightforward definition syntax, support for multiple build strategies, and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.
  gem 'factory_girl_rails'
  # Brings back `assigns` and `assert_template` to your Rails tests
  gem 'rails-controller-testing'
  # RSpec for Rails-3+
  gem 'rspec-rails'
  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers'
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Guard is a command line tool to easily handle events on file system modifications.
  gem 'guard'
  # Guard::LiveReload automatically reload your browser when 'view' files are modified.
  gem 'guard-livereload'
  # Guard::RSpec automatically run your specs (much like autotest)
  gem 'guard-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# bootstrap form
gem 'bootstrap_form'
