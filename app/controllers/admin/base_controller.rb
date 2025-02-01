class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin_or_manager
  
    private
  
    def authorize_admin_or_manager
      redirect_to root_path, alert: "Acceso no autorizado." unless current_user&.gerente? || current_user&.administrador?
    end
  end