# frozen_string_literal: true
require "active_record"
require "faker"
require "sinatra/flash"
require "./config/environment.rb"

run ApplicationController
use UsersController
use PetsController
use SessionsController
