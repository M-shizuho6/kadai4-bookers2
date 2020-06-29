class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]
  
  def index
  	 @user = current_user
     @users = User.all
     @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @userbooks = @user.books
  	@book = Book.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

end
