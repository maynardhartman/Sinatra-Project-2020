class SessionsController < ApplicationController
  get "/login" do
    erb :'users/login'
  end

  get "/sessions/login" do
    erb :'/users/login'
  end

  get "/logout" do
    session.clear
    erb :"/sessions/login"
  end
  
  post "/sessions/signup" do
    if logged_in?
      erb :"/pets/:id"
    else
      user = User.new(:fname => params[:fname], :lname => params[:lname], :addr_1 => params[:addr_1], :addr_2 => params[:addr_2],
        :city => params[:cite], :state => parmas[:state], :zipcode => params[:zipcode], :email => params[:email], :phone_1 => params[:phone_1],
        :phone_2 => params[:phone_2], :is_missing => params[:is_missing])
      binding.pry
      if user && user.save
        session[:user_id] = user.id
      else
        redirect "/sessions/signup" 
      end
    end
  end
end
