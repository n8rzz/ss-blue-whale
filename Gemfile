source 'https://rubygems.org'

gem 'rails', github: 'rails/rails'
gem 'pg', '~> 0.18'
gem 'puma', '3.2.0'
gem 'devise', :github => 'plataformatec/devise', :branch => 'master'
gem 'active_model_serializers', '~> 0.10.0.rc5'
gem 'rack-cors', :require => 'rack/cors'

gem 'time_difference', '~> 0.4.2'
gem 'faker', '~> 1.5.0'
gem 'coveralls', require: false

group :development do
  gem 'better_errors', '2.1.1'
end

group :development, :test do
  # gem 'rspec-rails', '3.1.0' # :branch => 'rails-5-support'
  gem 'rspec', '~> 3.5.0.beta1'
  gem 'rspec-core', '~> 3.5.0.beta1'
  gem 'rspec-rails', '~> 3.5.0.beta1'
  gem 'guard-rspec', '~> 4.6', require: false
  gem 'byebug', '8.2.2'
  gem 'database_cleaner', '1.5.1'
  gem 'rubocop', require: false
  gem 'guard-bundler', '2.1.0'
  gem 'guard-rubocop', '1.2.0', require: false
end

group :test do
  gem 'factory_girl_rails', '4.5.0'
  gem 'shoulda-matchers', '2.8.0'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
