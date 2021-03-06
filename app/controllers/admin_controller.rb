class AdminController < ApplicationController

  def index
  	user_auth
  	@users = User.all.order(created_at: :desc)
  end

  def new
  	user_auth
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
		if @user.save
      role = params[:user][:role]
      addRoleToUser(@user,role)
			redirect_to "/user", notice: "usuario creado exitosamente"
		else
			redirect_to "/user/new", notice: "Error al crear usuario"
		end
  end

  def edit_password
    user_auth
    @user = User.find(params[:id])
  end

  def update_password   
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/user/", notice: "Contraseña cambiada exitosamente"
    else
      redirect_to "/user/"+@user.id.to_s+"/edit_password/", notice: "Error al cambiar Contraseña"
    end
  end

  def lock_unlock
    #This locks and unlocks users
    @user=User.find(params[:id])
    if params[:status]=='true'
      #To lock user access
      @user.lock_access!
      @user.save
      redirect_to '/user', notice: 'Bloqueado con exito.'
    else
      #To unlock user access
      @user.unlock_access!
      @user.save
      redirect_to '/user', notice: 'Desbloqueado con exito.'
    end
     
  end

  def permitted_params
    #These are permitted parameters
        params.permit(:user => [:id, :status])
  end


  def user_params
	params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:state,:country,:phone,:position,:birthdate,:work, :ci)
  end

  def addRoleToUser(user,role)
    if(role =="administrador" )
      user.add_role :Super_usuario
      elsif (role =="modificador" )
        user.add_role :Administrador
      else
        user.add_role :Empleado
    end     
  end
  	
end
