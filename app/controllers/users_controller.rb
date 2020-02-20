class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You have signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Sorry please check for mistakes"
      flash[:color] = "invalid"
    end
    render "new"
  end
end
