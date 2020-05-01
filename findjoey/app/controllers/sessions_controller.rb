class SessionsController < ApplicationController
   post "/sessions/login" do
    if logged_in?
      puts "You are already logged in."
      erb :"/pets/index"
    end
    # get user data and process login
    @user = User.find_by(email: params[:email])
    if !@user
      flash[:alert] = "could not sign you in (internal error)"
      redirect "/sessions/login"
    else
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @pets = Pet.find_by(users_id: @user.id)
        redirect "/pets/index"
      else
        flash[:alert] = "There was a problem logging your in"
        redirect "/sessions/login"
      end 
    end
  end

  get "/logout" do
    session.clear
    erb :"/login"
  end

  post "/sessions/signup" do
    if !logged_in?
      erb :"/sessions/login"
    end

    @user = User.new(params)
      @user.save
    if @user && @user.authenticate(params[:password])
      session[:users_id] = @user.id 
      @pets = Pet.find_by(users_id: @user.id)
      erb :"/pets/index"
    else
      redirect "/login"
    end
  end
end
