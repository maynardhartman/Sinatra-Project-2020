class PetsController < ApplicationController
  get "/pets" do
    if !logged_in?
      redirect "/sessions/login"
    end
  end

  get "/pets/:id/new" do# add new pet to user account do
    if !logged_in?
      redirect "/sessions/login"
    else
      @pets = Pet.all #change back to params[:id]
      redirect "/sessions/show"
    end
  end

  get "/pets/show" do
    if !logged_in?
      redirect "/sessions/login"
    end
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(parmas[:email])
      session[:user_id] = @user.id
      @pets = Pet.find_by(users_id: :user.id)
      binding.pry
      redirect "/pets/show"
    else
      redirect "/sessions/login"
    end
  end

  post "/pets/:id/edit" do
    @pets = Pet.find_by_id(:id)
    binding.pry
    @user = current_user
    user.users_id = @user.id

  end 

  get "/pets/new" do
     erb :"/pets/new"
  end
end
