class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome back, #{user.name}!"
      sign_in user
      redirect_to images_path
    else
      flash.now[:alert] = "Login failed, email or password is incorrect"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end