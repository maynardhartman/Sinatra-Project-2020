class PetsController < ApplicationController
    get "/pets" do
        redirect_if_not_logged_in
    end
end
