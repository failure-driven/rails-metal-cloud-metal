# frozen_string_literal: true

source "https://rubygems.org"

group :test do
  gem "capybara", "~> 3.39"
  gem "rspec", "~> 3.12"
  gem "rspec-example_steps", "~> 3.1"
  gem "selenium-webdriver", "~> 4.14"
end

group :development do
  gem "capistrano", "~> 3.18", require: false
  # required by capistrano for ed25519 SSH keys
  gem "ed25519", "~> 1.3"
  gem "bcrypt_pbkdf", "~> 1.1"

  gem "kamal", "~> 1.0"

  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
  gem "standard", require: false
end

