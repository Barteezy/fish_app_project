class MainController < ApplicationController

  def root
    render :index
  end

  def login_get
    render :login
  end

  def sign_up_get
    render :sign_up
  end

  def sign_up_post
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]

    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Thanks for signing up'
      redirect_to '/'
    else
      render :sign_up
    end
  end

  def login_post
      username = params[:username]
      password = params[:password]

      user = User.find_by(username: username)

      if user == nil
        flash[:error] = "Username Not Found"
        render :login
      else
        if user.authenticate(password)
          session[:user_id] = user.id
          redirect_to "/profile"
        else
          flash[:error2] = "Password does not match"
          render :login
        end
      end
  end


  def profile_get
    render :profile
  end

  def logout
    session.clear
    redirect_to "/"
  end


end