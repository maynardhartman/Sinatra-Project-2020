class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    redirect_if_not_logged_in
    erb :'/users/signup'
  end

  post "/users/signup" do
    @user = User.create(:fname => params[:fname], :lname => params[:lname], :addr_1 => params[:addr_1], :addr_2 => params[:addr_2],
    :city => params[:cite], :state => parmas[:state], :zipcode => params[:zipcode], :email => params[:email], :phone_1 => params[:phone_1],
    :phone_2 => params[:phone_2], :is_missing => params[:is_missing])
    
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
