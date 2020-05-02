require "sinatra"
require "pry"
require "bcrypt"

class ApplicationController < Sinatra::Base # frozen_string_literal: true
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "Skinny balinki long legs, big banana feet."
  end

  get "/" do
    erb :"welcome"
  end

  get "/login" do
    redirect "/sessions/login"
  end

  get "/sessions/signup" do
    erb :"/sessions/signup"
  end


  get "/sessions/login" do
    erb :"/sessions/login"
  end
  
  get "/sessions/show" do
    erb :"/sessions/show"
  end

  get "/logout" do
    session.clear
    redirect "/logout"
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
        redirect "/sessions/login"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/pets"
      end
    end
  end
end
