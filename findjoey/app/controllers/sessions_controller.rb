class SessionsController < ApplicationController
  get "/login" do
    erb :'sessions/login'
  end

  get "/sessions/login" do
    erb :'sessions/login'
  end

  post "/sessions/login" do
    #find the user in db

    user = User.find_by(email: params[:email])
    binding.pry
    if !:user
      flash[:info] = "Not Logged In"
      redirect "/sessions/login"
    end
    # check the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :"/pets/show"
    else
      redirect "/login"
    end

    get "/logout" do
      session.clear
      redirect "/login"
    end
  end
end
