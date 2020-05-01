class PetsController < ApplicationController
  get "/pets" do
    if !logged_in?
      redirect "/users/login"
    else
      erb :"welcome"
    end
  end

  get "/pets/:id" do
    if !logged_in?
      redirect "/session/login"
    else
      @pets = Pet.find_by_id(:users_id) #change back to params[:id]
      redirect "/session/show"
    end
  end

  get "/pets/show" do
    if !logged_in?
      erb :"/users/login"
    end
    @user = User.find_by(email: params[:email])
    binding.pry
    if @user && @user.authenticate(parmas[:email])
      binding.pry
      session[:user_id] = @user.id
      @pets = Pet.find_by(users_id: :user.id)
      redirect "/pets/show"
    else
      redirect "/session/login"
    end
  end
end
