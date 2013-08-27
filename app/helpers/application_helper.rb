module ApplicationHelper

  def validate_and_create_user
    session[:error] = []
    current_params = user_params.dup
    if current_params[:password].length < 6
      session[:error] << "Please ensure your password is at least 6 characters in length."
    else
      current_params[:password_hash] = BCrypt::Password.create(current_params[:password])
      current_params.delete(:password)
      current_params[:name] = current_params[:name].capitalize
      user = User.new(current_params)
      if user.valid?
        session[:email] = user.email
        session[:error] = nil
        user.save
      else
        session[:error] << "You've already created an account with this email address.  Please login!"
      end
    end
  end

  def confirm_login
    session[:error] = []
    if User.where(email: params[:username]).count > 0
      if User.authenticate(params[:username], params[:password])
        session[:email] = params[:username]
      else
        session[:error] << "Incorrect password.  Please try again!"
      end
    else
      session[:error] << "Invalid email!  Please try again."
    end
  end

  def current_user
    User.where(email: session[:email]).first
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
