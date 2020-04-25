class PetsController < ApplicationController
  get "/pets" do
   if !logged_in?
    flash[:error] = "Not Logged In!"
    redirect '/sessions/login'
   else
    @pets = Pets.find_by(:owner_id params[:id])
    binding.pry
    erb :"/pets/show"
   end
  end

  get '/pets/:id/show' do
    @pet = Pets.find_by(:id params[:owner_id])
    erb :'/pets/show'
  end
  helpers do

  end

end
