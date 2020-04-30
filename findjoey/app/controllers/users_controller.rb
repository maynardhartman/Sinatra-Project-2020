class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    if logged_in? 
      redirect "/users/show"
    end
  end

  post "/users/login" do
    if logged_in?
      puts "You are already logged in."
      redirect "/pets/index"
    end
    # get user data and process login
    @user = User.find_by(email: params[:email])
    binding.pry
    if !@user
      redirect "/users/login"
    else
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @pets = Pet.find_by(users_id: @user.id)
        erb :"/pets/index"
      else
        redirect "/users/login"
      end 
    end
  end
  



  get "/users/show" do
    redirect  "/pets/show"
  end

  get "/users/pets" do
    redirect "/pets/"
  end
end
