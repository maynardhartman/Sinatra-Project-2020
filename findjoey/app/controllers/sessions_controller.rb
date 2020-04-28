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
    if !:user
      flash[:info] = "Not Logged In"
      redirect "/sessions/login"
    end
    # check the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/pets/#{user.id}/show"
    else
      redirect "/sessions/login"
    end

    get "/logout" do
      session.clear
      redirect "/login"
    end
  end

  post "/sessions/signup" do
    if logged_in?
      flash[:notice] = "You are already logged in!"
      redirect "/pets/index"
    else
      @user = User.new(params)
      if @user && @user.save
        session[:user_id] = @user.id
      else
        redirect "/sessions/signup" 
      end
    end
  end
end
