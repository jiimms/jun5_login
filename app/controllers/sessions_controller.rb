class SessionsController < ApplicationController

	skip_before_action :check_session, :only =>[:new, :create, :log_in]
	
  def new
  end

  def create
  	user=User.find_by_email(params[:sessions][:email])
  	if user && user.authenticate(params[:sessions][:password])
  		flash[:success] = "Welcome"
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = "Check your details"
  		render :new
  	end
  end

  def destroy
  	log_out
  	flash[:danger] = "See you later"
  	redirect_to login_path
  end
end
