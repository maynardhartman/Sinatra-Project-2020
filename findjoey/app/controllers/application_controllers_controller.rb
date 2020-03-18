class ApplicationControllersController < ApplicationController

  # GET: /application_controllers
  get "/application_controllers" do
    erb :"/application_controllers/index.html"
  end

  # GET: /application_controllers/new
  get "/application_controllers/new" do
    erb :"/application_controllers/new.html"
  end

  # POST: /application_controllers
  post "/application_controllers" do
    redirect "/application_controllers"
  end

  # GET: /application_controllers/5
  get "/application_controllers/:id" do
    erb :"/application_controllers/show.html"
  end

  # GET: /application_controllers/5/edit
  get "/application_controllers/:id/edit" do
    erb :"/application_controllers/edit.html"
  end

  # PATCH: /application_controllers/5
  patch "/application_controllers/:id" do
    redirect "/application_controllers/:id"
  end

  # DELETE: /application_controllers/5/delete
  delete "/application_controllers/:id/delete" do
    redirect "/application_controllers"
  end
end
