require "rubygems"
require "bundler"
require "capybara/dsl"
require 'capybara'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)