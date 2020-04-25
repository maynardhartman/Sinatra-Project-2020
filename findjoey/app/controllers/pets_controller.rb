class PetsController < ApplicationController
  get "/pets/:id" do
    if !logged_in?
      flash[:error] = "Not Logged In!"
      redirect "sessions/login"
    else
      @pets = Pets.find_by_id(:id)
      erb :"/pets/:id/show"
    end
  end

  get "/pets/:id/show" do
    @pet = Pets.find_by_id(:id)
    erb :'/pets/:id/show'
  end
end
