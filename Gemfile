source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'rails-i18n'

gem 'devise'
gem 'devise-i18n'

gem 'puma', '~> 4.1'

gem 'uglifier'

gem 'webpacker', '~> 4.0'
gem 'bootsnap', require: false

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
end
