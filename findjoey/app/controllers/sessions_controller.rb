
class SessionsController < ApplicationController
  post "/sessions/login" do
    if !logged_in?
      # You must be logged in and authenticated
      redirect "/users/index"      
    else
      # get user and authenticate
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
          
  end
  
    
   
  get "/logout" do
    session.clear
      erb :"/logout"
  end

  post "/sessions/signup" do
    if !logged_in?
      erb :"/sessions/login"
    end
  end

  get "/sessions/show" do
   
   end
  

  def load_pets
    if logged_in?
      @pets = Pet.find_by(users_id: current_user.id)
      return(@pets)
    end
  end
end
