class SessionsController < ApplicationController
  get "/login" do
    erb "/sessions/login"
  end

  get "/sessions" do
    erb :"/sessions/login"
  end

  get "/sessions/login" do
    erb :"/sessions/login"
  end

  post "/sessions/login" do
    #find the user in db
    user = User.find_by(user_email: params[:user_email])
    binding.pry
    if user == nil
      redirect "/session/login"
    end
    # check the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/pets"
    end
  end
end
