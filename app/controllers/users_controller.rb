class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new(email: params[:session]["email"], password: params[:session]["password"], password_confirmation: params[:session]["password_confirmation"], name: params[:session]["name"])
    if @user.save
      log_in @user
      flash[:danger] = "Tu as bien été connecté.e !"
      puts @user.id
      puts @user.name
      redirect_to :action=>"show", :controller=>"sessions", :id=>"#{@user.id}"
    else flash[:danger] = "Tu t'es trompé.e dans la confirmation de ton mot de passe. Recommence ton inscription."
      render 'new'
    end
  end

  def edit
    puts params[:id]
    @user_new = User.find(params[:id])
  end

  def edit_after
    puts params[:id]
    @user_new = User.find(params[:id])
    if @user_new == @current_user
      @user_new.update_attributes(name: "params[:session][:name]", email: "params[:session][:email]")
    else
      flash[:danger] = "Ton profil a été mis à jour."
      render 'edit'
    end
  end

end
