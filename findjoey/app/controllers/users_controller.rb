class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    if logged_in 
      redirect "/users/index"
    end
  end

  post "/users/signup" do
    user = User.create(:fname => params[:fname], :lname => params[:lname], :addr_1 => params[:addr_1], :addr_2 => params[:addr_2],
    :city => params[:cite], :state => parmas[:state], :zipcode => params[:zipcode], :email => params[:email], :phone_1 => params[:phone_1],
    :phone_2 => params[:phone_2], :is_missing => params[:is_missing])

    if user && user.save
      session[:user_id] = user.id
      redirect "/pets"
    else
      erb :'users/signup'
    end
  end

  post "/users/login" do
    # get user data and process login
    user = User.find_by(email: params[:email])
    if !user
      redirect "/users/login"
    else
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        @pets = Pet.all
        erb :"/pets/index"
      else
        redirect "/users/login"
      end 
    end
  end

  get "/users/pets" do
    erb :"users/pets"
  end

  get "/logout" do
    session.clear
    erb :"/users/login"
  end
end
