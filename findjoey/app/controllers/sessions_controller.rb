class SessionsController < ApplicationController
  get "/login" do
    erb "/sessions/login"
  end

  get "/sessions" do
    erb :"/sessions/login"
  end

  get "/sessions/login" do
    erb :"/login"
  end

  post "/login" do
    #find the user in db
    user = User.find_by(user_email: params[:email])

    # check the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/pets"
    else
      redirect "/login"
    end
  end
end
