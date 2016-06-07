class UsersController < ApplicationController
  skip_before_action :check_session, :only => [:new, :create]
  def new
  	@user =User.new
  end

  def create
  	@user =User.new(user_params)
  	if @user.save
  		redirect_to @user
      log_in @user
  	else
  		render :new
  	end
  end
 
  def index
    @user=User.where(email: current_user.email)
  	#@user=current_user
    
  end

  def edit
  	@user =User.find params[:id]
  end

  def update
  	@user =User.find params[:id]
  	if @user.update(user_params)
  		redirect_to @user
  	else
  		render :edit
  	end
  end

  def destroy
  	@user =User.find params[:id]
  	@user.delete
  	redirect_to root_path
  end

  def show
  	@user=User.find params[:id]
  end
  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end
end
