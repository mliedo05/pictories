class UsersController < ApplicationController
  before_action :user_params, only: %i[ create ]

  def new
    @user = User.new
    end

    def create
      @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render action: :new
        end
    end

    def show
      @user= User.find(helpers.current_user.id)
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
