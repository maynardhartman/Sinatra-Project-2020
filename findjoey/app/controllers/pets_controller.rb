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
      @pets = Pet.find_by_id(:users_id) #change back to params[:id]
      redirect "/pets/show"
    end
  end

  get "/pets/show" do
    if !logged_in?
      erb :"users/login" 
    else
      @pets = Pet.find_by(users_id: :current_user.id)  # change back to params[:id]
      binding.pry
      if pets
        erb :"pets/show"
      else
        @pets.users_id = 1 #dummy value to make work 
        erb :"pets/show"
     end
    end
  end

  delete "/pets/:id" do
    if !logged_in?
      erb :"/usr/login"
    else
      @pet = Pet.find_by_id(:users_id)
      if @pet.users_id == current_user.id
        binding.pry
        @pet.destroy
      end
    end 
  end
end
