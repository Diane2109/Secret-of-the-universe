class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new(email: params[:session]["email"], password: params[:session]["password"], password_confirmation: params[:session]["password_confirmation"], name: params[:session]["name"])
    if @user.save
      log_in @user
      flash[:danger] = "Tu as bien été connecté.e !"
      #puts @user_id = @user.id
      #puts @user_name = @user.name
      redirect_to :action=>"show", :controller=>"sessions", :id=>"#{@user.id}"
    else flash[:danger] = "Tu t'es trompé.e dans la confirmation de ton mot de passe. Recommence ton inscription."
      render 'new'
    end
  end

  def edit
    current_user
    @current_user
    @user = User.find(params[:id])
  end

  def edit_after
    current_user
    current_user_id = @current_user.id
    @user = User.find(params[:id])
    user_id = @user.id
    if current_user_id == user_id
      @user.update_attributes(:name => params[:session][:name], :email => params[:session][:email], :password => params[:session][:password], :password_confirmation => params[:session][:password_confirmation])
      flash[:danger] = "Ton profil a été mis à jour."
      redirect_to show_id_path
    else
      flash[:danger] = "ATTENTION, tu ne peux modifier que ton profil."
      redirect_to show_id_path
    end
  end


end
