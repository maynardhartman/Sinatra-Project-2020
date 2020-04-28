class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    redirect_if_not_logged_in
    erb :'/users/signup'
  end

  post "/users/signup" do
    @user = User.create(params)
    binding.pry
    if @user && @user.save
      session[:user_id] = @user.id
      redirect "/pets"
    else
      erb :'users/signup'
    end
  end
  get "/users/pets" do
    erb :"users/pets"
  end
end
