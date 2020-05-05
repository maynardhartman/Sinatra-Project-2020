class PetsController < ApplicationController
  get "/pets" do
    if !logged_in?
      redirect "/sessions/login"
    end
    erb :"/pets/show"
  end

  get "/pets/new" do# add new pet to user account do
    if !logged_in?
      redirect "/sessions/login"
    else 
      @pets = Pet.where(users_id: session[:user_id])
      erb :"/pets/new"
    end
  end

  post "/pets/new" do
    if !logged_in?
      redirect "/sessions/login"
    end
    if !@pet
      @pet = Pet.create(name: params[:name], breed: params[:breed], weight: params[:weight], temperament: params[:temperament], chipped: params[:chipped],
        chip_id: params[:chip_id], collared: params[:collared], color: params[:color], went_missing: params[:went_missing], date_found: params[:date_found],
        image: params[:image])
      @pets = Pet.where(users_id: session[:user_id])
      erb :"/pets/show"
    end
  end

  get "/pets/show" do
    if !logged_in?
      redirect "/sessions/login"
    end
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(parmas[:email])
      session[:user_id] = @user.id
      @pets = Pet.where(users_id: @user.id).to_a
      erb :"/pets/show"
    else
      redirect "/sessions/login"
    end
  end

  get "/pets/edit" do
    @pets = Pet.where(users_id: session[:user_id])
    erb :"/pets/edit" 
  end

  post "/pets/delete" do
    if logged_in?
      owner = current_user
      @pet = Pet.find_by(users_id: owner.id, name: params[:name])
      if !@pet  #didnt find pet
          redirect "/pets/show"
      else
          @pet.destroy  
      end
      @pets =  Pet.where(users_id: owner.id).to_a 
      erb :"/pets/show" 
    end
      redirect "/sessions/login"
  end


  get "/pets/index" do
    erb :"/pets/index"
  end
end
