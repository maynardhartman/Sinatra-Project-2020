# frozen_string_literal: true
require "active_record"
require "./config/environment.rb"

if ActiveRecord::Migrator.needs_migration?
  raise "Migrations are pending. Run `rake db:migrate` to resolve the issue."
end

run ApplicationController
use Users
use Pets
