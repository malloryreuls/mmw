class AdminsController < ApplicationController

  def index
  	@admins = Admin.all
    @history = Search.all
  end

  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(admin_params)
  	if @admin.save
  		redirect_to admins_path
  	else
  		render 'new'
  	end
  end

  def show
  	@admin = Admin.find(params[:id])
  end

 protected

  def admin_params
  	params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
