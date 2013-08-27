class SessionsController < ApplicationController
  def new
  end

  def create
    confirm_login
    redirect_to controller: "posts", action: "index"
  end
end  
