class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to '/requests', :notice => "Signed up!"
    else
      render "new"
    end
  end

  def allowed_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
