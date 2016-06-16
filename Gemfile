source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Gem to create paginations
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
gem 'api-pagination'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'cancancan', '~> 1.13', '>= 1.13.1'

# Style gems. Bootstrap, vendor prefixer, boostwatch theme, font-awesome
gem 'bootstrap-sass', '~> 3.3.6'
gem 'autoprefixer-rails'
gem 'bootswatch-rails'
gem "font-awesome-rails"

# To make form making a ton easier
gem 'simple_form'

#These 2 gems add a nice list for multiple tags
gem 'compass-rails'
gem 'chosen-rails'
gem 'bootstrap-chosen-rails'

# These 2 gems help with markdown of blog posts and higlights
gem 'pygments.rb'
gem 'redcarpet'

#This gem helps with turbolinks issues on the chosen gem above.
gem 'jquery-turbolinks'

#This gem allows to add actions to delayed (external worker), job web is a web interface to view queued jobs
gem 'delayed_job_active_record'
gem "delayed_job_web"

gem 'rack-cors', :require => 'rack/cors'

# Adds oauth via twitter
gem 'omniauth-twitter'
# Adds oauth via github
gem 'omniauth-github'
# Adds oauth via linkedin
gem 'omniauth-linkedin'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'interactive_editor'
  gem 'awesome_print'
  gem 'hirb'
  # gem 'pry'
  # gem 'pry-rails'
  # gem 'pry-doc'
  gem 'faker'
  gem 'rspec-rails'
  gem 'cowsay'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem "letter_opener"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
