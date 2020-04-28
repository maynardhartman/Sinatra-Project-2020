class PetsController < ApplicationController
  get "/pets" do
    erb :"index"
  end

  get "/pets/:id" do
    if !logged_in?
      flash[:error] = "Not Logged In!"
      binding.pry
      redirect "/sessions/login"
    else
      @pets = Pet.find_by_id(:id)
      redirect "/pets/show"
    end
  end

  get "/pets/show" do
    if !logged_in?
      flash[:error] = "You Are Not Logged In. Must Log In."
      redirect "/sessions/login" 
    else
      @pets = Pet.find_by_id(:id)
      erb :"/show"
    end
  end
end
