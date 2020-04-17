# frozen_string_literal: true
require "sinatra"
require "./config/environment.rb"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
  end

  get "/" do
    erb :welcome
  end
end
