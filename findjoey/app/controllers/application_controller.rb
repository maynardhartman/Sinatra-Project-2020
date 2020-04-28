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
  end

  get "/" do
    erb :"welcome"
  end

  get "/login" do
    if !logged_in?
      redirect "/users/login"
    else
      redirect "/pets/index"
    end
  end

  get "/users/signup" do
    erb :'users/signup'
  end

  get "/pets" do
    if logged_in?
      @pets = Pet.all
    erb :"pets/index"
    else
      redirect "/users/login"
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
      @current_owner_of_pet ||= Pet.find_by(user_id: session[:user_id])
      binding.pry
    end

    def find_by_user_id(id)
      pet = Pet.find_by_id(:users_id session[:user_id])
      binding.pry
      if !pet 
         return nil;
      else
        return(pet)
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/sessions/login"
      end
    end
  end
end
