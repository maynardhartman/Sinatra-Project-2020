class UsersController < ApplicationController
  get "/users" do
    redirect_if_not_logged_in
  end

  get "/users/signup" do
    if logged_in? 
      redirect "/users/show"
    end
  end

  post "/users/login" do
    # get user data and process login
    @user = User.find_by(email: params[:email])
    if !@user
      redirect_to "/users/login.erb"
    else
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @pets = Pet.all
        erb :"pets/index.erb"
      else
        redirect "/users/login.erb"
      end 
    end
  end

  post "/users/signup" do
    user = User.create(:fname => params[:fname], :lname => params[:lname], :addr_1 => params[:addr_1], :addr_2 => params[:addr_2],
    :city => params[:city], :state => parmas[:state], :zipcode => params[:zipcode], :email => params[:email], :phone_1 => params[:phone_1],
    :phone_2 => arams[:phone_2], :is_missing => params[:is_missing], :password => params[:password])
    # act like its a signin so user doesnt have to
    if user && user.save
      if user && user.authenticate(parmas[:password])
        session[:user_id] = user.id
        redirect "/pets/show"
      else
        redirect "/users/signup"
      end
    end
  end

  get "/users/show" do
    redirect  "/pets/show"
  end

  get "/users/pets" do
    redirect "/pets/pets"
  end
end
