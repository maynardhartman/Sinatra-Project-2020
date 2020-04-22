# frozen_string_literal: true

ENV["SINATRA_ENV"] ||= "development"

require "bundler/setup"

Bundler.require(:default, ENV["SINATRA_ENV"])

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  database: "world",
  host: "127.0.0.1",
  username: "MJHAR",
  password: "QsPJJ4980T2T",
)

require "./app/controllers/application_controller"
require_all "app"
