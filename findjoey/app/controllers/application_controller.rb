# frozen_string_literal: true
require "sinatra"
require "sinatra/flash"
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
    if !logged_in?
      redirect "/sessions/login"
    else
      redirect "/pets"
    end
  end

  post "/sessions/login" do
    if logged_in?
      redirect :"/pets"
    else
      flash[:notice] = "Login Failed.  Try Again"
      redirect "/sessions/login"
    end
  end

  helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_owner_of_pet
      @current_owner_of_pet ||= Pet.find_by(owner_id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/sessions/login"
      end
    end
  end
end
