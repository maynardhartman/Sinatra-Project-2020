class SessionController < ApplicationController
  post "/session/login" do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @pets = Pet.where(users_id: @user.id).to_a
      @missing = Pet.count("is_missing")
      erb :"/pets/index"
    else
      # redirect to our login page
      redirect "/session/login"
    end
  end

  get "/logout" do
    session.clear
    erb :"/session/login"
  end

  get "/session/signup" do
    erb :"/session/signup"
  end

  post "/session/signup" do
    if !logged_in?
      erb :"/session/login"
    end
    @user = User.create(params)
    if !@user #something happened to form data
      puts (User.error.full_messages)
      redirect "/session/login"
    end
  end

  def load_pets
    if logged_in?
      return(Pet.where(users_id: current_user).to_a)
    end
  end
end
