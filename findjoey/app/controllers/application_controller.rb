# frozen_string_literal: true
require "sinatra"
require "pry"
require "./config/environment.rb"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "Skinny balinki long legs, big banana feet."
    register Sinatra::Flash
  end

  get "/" do
    erb :"welcome"
  end

  get "/login" do
    redirect "/sessions/login"
  end

  get "/sessions/login" do
    erb :"/sessions/login"
  end
  
  get "/logout" do
    session.clear
    redirect "/logout"
  end

  get "/signup" do
    erb :"/sessions/signup"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_owner_of_pet
      @current_owner_of_pet ||= Pet.find_by(users_id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def redorect_of_logged_in
      if logged_in?
        redirect "/pets"
      end
    end
  end
end
