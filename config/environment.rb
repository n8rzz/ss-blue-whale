# Load the Rails application.
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:short_date,] = '%Y-%m-%d'

# Initialize the Rails application.
Rails.application.initialize!
