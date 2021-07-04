class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    pass = BCrypt::Password.new(@user.password_digest)
    if @user.present? && pass==params[:user][:password]
      session[:user_id]=@user.id
      redirect_to stories_path
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  
end
