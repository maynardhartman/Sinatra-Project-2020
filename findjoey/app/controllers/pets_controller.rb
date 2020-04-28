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
      redirect "/sessions/login"
    else
      @pets = Pet.find_by_id(params[:id])
      redirect "/pets/show"
    end
  end

  get "/pets/:id/" do
    #get pet from db and dispaly it's attributes
    @pets = pets.find_by_user_id(params[:id])
    binding.pry
  end

  get "/pets/show" do
    if !logged_in?
      redirect "/users/login" 
    else
      @pets = Pet.find_by_id(params[:id])
      erb :"show"
     end
  end
end
