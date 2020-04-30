class SessionsController < ApplicationController
  get "/login" do
    erb :'users/login'
  end

  get "/sessions/login" do
    erb :'/users/login'
  end

  get "/logout" do
    session.clear
    erb :"/sessions/login"
  end
end
