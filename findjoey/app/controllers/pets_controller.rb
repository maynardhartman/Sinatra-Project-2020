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
      redirect "/users/login"
    else
      @pets = Pet.find_by_id(1) #change back to params[:id]
      redirect "/pets/show"
    end
  end

  get "/pets/:id/" do
    #get pet from db and dispaly it's attributes
    @pets = pets.find_by_user_id(:id) 
    erb :"show"#change back to params[:id]
  end

  get "/pets/show" do
    if !logged_in?
      redirect "/users/login" 
    else
      @pets = Pet.find_by_id(:user_id])  # change back to params[:id]
      erb :"show"
     end
  end
end
