class SessionsController < ApplicationController




  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      puts params[:session][:name] = @user.name
      puts params[:session][:id] = "#{@user.id}"
      puts params[:session][:email]
      puts params
      @user_name = params[:name]
      log_in @user
      redirect_to :action=>"show", :controller=>"sessions", :id=>"#{@user.id}"
    else
      flash[:danger] = "Il y a eu une erreur d'adresse mail ou de mot de passe !"
      render 'new'
    end
  end

  def destroy
  end

  def show
    if logged_in? == false
      flash.now[:danger] = "Il faut être connecté.e pour voir le secret de l'Univers !"
      render 'new'
    else
      puts params["id"]
      user = User.find(params["id"])
      @user_name = user.name
      puts @user_name
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end

  def index
  end

  def edit

  end


end
