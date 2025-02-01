class Admin::UsersController < Admin::BaseController
        before_action :authenticate_user!
        before_action :authorize_admin_or_manager, except: [:index, :show]
        before_action :authorize_admin, only: [:update_role, :deactivate]
      
        def index
          @users = User.all
        end
      
        def show
          @user = User.find(params[:id])
        end
      
        def new
          @user = User.new
        end
      
        def create
          @user = User.new(user_params)
          if @user.save
            redirect_to admin_users_path, notice: "Usuario creado exitosamente."
          else
            render :new, status: :unprocessable_entity
          end
        end
      
        def edit
          @user = User.find(params[:id])
        end
      
        def update
          @user = User.find(params[:id])
          if @user.update(user_params)
            redirect_to admin_users_path, notice: "Usuario actualizado."
          else
            render :edit, status: :unprocessable_entity
          end
        end
      
        def update_role
          @user = User.find(params[:id])
          if current_user.administrador? && @user.administrador?
            redirect_to admin_users_path, alert: "No puedes modificar otro administrador."
          else
            @user.update(role: params[:user][:role])
            redirect_to admin_users_path, notice: "Rol actualizado."
          end
        end
      
        def deactivate
          @user = User.find(params[:id])
          @user.deactivate!
          redirect_to admin_users_path, notice: "Usuario desactivado."
        end
      
        private
      
        def user_params
          params.require(:user).permit(:name, :email, :phone, :role, :active)
        end
      
        def authorize_admin_or_manager
          redirect_to root_path, alert: "No autorizado." unless current_user&.gerente? || current_user&.administrador?
        end
      
        def authorize_admin
          redirect_to root_path, alert: "Solo los administradores pueden realizar esta acción." unless current_user&.administrador?
        end
      end
