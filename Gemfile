source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'pg', '~> 0.18'
gem 'puma'
gem 'faker', '~> 1.5.0'
gem 'active_model_serializers', '~> 0.10.0.rc2'
gem 'rack-cors', :require => 'rack/cors'
gem 'coveralls', require: false

group :development, :test do
  gem 'rspec-rails', '3.1.0' # :branch => 'rails-5-support'
  gem 'byebug'
  gem 'better_errors', '~>2.1.1'
  gem 'database_cleaner'
  gem 'rubocop', require: false
  gem 'guard-bundler', '2.1.0'
  gem 'guard-rspec', '4.5.0', require: false
  gem 'guard-rubocop', '1.2.0', require: false
end

group :test do
  gem 'factory_girl_rails', '4.5.0'
  gem 'shoulda-matchers', '2.8.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
