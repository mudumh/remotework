source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'simple_form'
#Stripe webhook integration for Rails applications
gem 'stripe_event'

gem 'bcrypt'
# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0.0.beta2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
#gem 'jquery-turbolinks'

# used to seed the db.
gem 'faker',                '1.4.2'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'tinymce-rails'
# Use Unicorn as the app server
# gem 'unicorn'
#stripe for payment
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
#fulltext searching based on lucene
# uploads
gem "mini_magick"
gem 'carrierwave'


#fulltext searching based on pg db
gem 'pg_search'

#pagination
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'
gem  'rails_autolink'


group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  #this is a "good" production grade server for rails
  gem 'unicorn',        '4.8.3'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
  gem 'pg',             '0.17.1'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3',     '1.3.9'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta4'
  gem 'spring',      '1.1.3'
  gem 'pg',             '0.17.1'

end

