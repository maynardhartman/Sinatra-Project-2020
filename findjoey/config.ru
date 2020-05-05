# frozen_string_literal: true
require "active_record"
require "faker"

require "./config/environment.rb"

run ApplicationController
use SessionController
use UsersController
use PetsController
