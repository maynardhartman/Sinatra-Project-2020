class UsersController < ApplicationController
  get "/users/signup" do
    erb :'/users/signup'
  end

  post "/users/signup" do
    @user = User.new()
    binding.pry
    session[:user_id] = @user.id
  end
end
user_fname: Faker::Name.first_name,
    user_lname: Faker::Name.last_name,
    addr_1: Faker::Address.street_address,
    addr_2: nil,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    user_zipcode: Faker::Address.zip_code,
    user_email: Faker::Internet.safe_email,
    user_phone_1: Faker::PhoneNumber.cell_phone,
    user_phone_2: Faker::PhoneNumber.cell_phone,
    is_missing: 1,
    account_verified: 1,
    account_suspended: 0,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    password: "password",