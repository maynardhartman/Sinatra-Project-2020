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

  get "/pets" do
    if logged_in?
      @pets = Pet.all.find_by_id(:id)
    erb :"/pets/show"
    else
      redirect "/users/login"
    end
  end

  get "/pets/show" do
    erb :"/pets/show"
  end

get "/users/login" do
  if logged_in?
    erb :"index"
  end

  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] == @user.id
    @pets = Pet.all # need to put more granularity on this
    redirect :"/users/show_2"
  else
      erb :"/users/login"
  end
end

  get "/logout" do
    session.clear
    erb :"/users/logout"
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
    end

    def find_by_user_id(id)
      if !logged_in?
        redirect "/users/login"
      end
      @pets = Pet.find_by_id(1)
      if !pets 
         return nil;
      else
        return(@pets)
      end
    end
   
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/sessions/login"
      end
    end
  end
end
