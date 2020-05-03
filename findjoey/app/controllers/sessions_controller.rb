
class SessionsController < ApplicationController
  post "/sessions/login" do
    if !logged_in?
      # You must be logged in and authenticated
      redirect "/sessions/login"      
    else
      # get user and authenticate
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          @pets = Pet.where(users_id: @user.id).to_a
          erb :"/pets/index"
      else
        # redirect to our login page
        redirect "/sessions/login"
      end
    end
  end
  
  get "/session/login" do
    if logged_in?
      @pets = Pet.where(users_id: @user.id).to_a
      if !@pets # operationed failed try again
         @pets = load_pets
      end
        erb :"/pets/index"
    else
      redirect "/sessions/login"
    end
  end
   
  get "/logout" do
    session.clear
      erb :"/logout"
  end

  get "/sessions/signup" do
    erb :"/signup"
  end

  post "/sessions/signup" do
    if !logged_in?
      erb :"/sessions/login"
    end
    @user = User.new(params)
    if !@user #something happened to form data
      puts (User.error.full_messages)
    end
  end

  def load_pets
    if logged_in?
      return(Pet.where(users_id: current_user).to_a)
    end
  end
end
