# Adds back ActionDispatch middleware used by Devise and not included with rails --api
Rails.application.config.middleware.use ActionDispatch::Flash
