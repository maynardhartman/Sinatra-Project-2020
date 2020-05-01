class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    if logged_in? 
      redirect "/pets/show"
    end
  end

  
  
  get "/users/signup" do
    if !logged_in?
      erb :"sessions/login" 
    end
    @user = User.create(fname: params[:fname], lname: params[:lname], addr_1: params[:addr_1], addr_2: params[:addr_2], city: params[:city],
      state: params[:state], zipcode: params[:zipcode], email: params[:email], phone_1: params[:phone_1], phone_2: params[:phone_2],
      is_missing: params[:is_missing], account_verified: params[:account_verified], account_suspended: params[:account_suspended],
      suspension_reason: params[:suspension_reason], longitude: params[:longitude], latitude: params[:latitude], password: params[:password])

    # create user then log them in
    if @user
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        binding.pry
        redirect "/pets/show"
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
