class UsersController < ApplicationController
  def create
    validate_and_create_user
    redirect_to controller: "posts", action: "index"
  end

  def new
    @user = User.new
  end

end  
