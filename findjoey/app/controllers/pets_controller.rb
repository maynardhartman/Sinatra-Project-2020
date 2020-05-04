class PetsController < ApplicationController
  get "/pets" do
    if !logged_in?
      redirect "/sessions/login"
    end
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

  delete "/pets/:id/delete" do
    if logged_in?
      @owner = @current_user
      if @pet.find_by_id(params[:id]) && pet.users_id == @owner
        binding.pry
        @pet.destroy
      else
        puts "Pet Not Found"
      end
        @pets = Pet.where(users_id: @user.id).to_a
        erb :"index"
    end
    redirect "/sessions/login"
  end


  get "/pets/index" do
    erb :"/pets/index"
  end
end
