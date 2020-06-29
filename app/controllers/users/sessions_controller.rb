# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def new
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      redirect_to user_session_path
    end
  end

  def create
    @user = User.check(params[:session][:name], params[:session][:password])
    if @user
      session[:email] = @user.email
      flash[:success] = "Signed in successfully."
      redirect_to user_path(current_user)
    else
      redirect_to :back
    end
  end

  def destroy
    session.delete(:name)
    flash[:notice] = "Signed out successfully."
    render 'home/top'
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
