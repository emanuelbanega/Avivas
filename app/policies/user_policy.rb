class UserPolicy < ApplicationPolicy
    def index?
      user.gerente? || user.administrador?
    end
  
    def show?
      user.gerente? || user.administrador?
    end
  
    def create?
      user.gerente? || user.administrador?
    end
  
    def update?
      user.gerente? || user.administrador?
    end
  
    def update_role?
      user.administrador? && !record.administrador?
    end
  
    def deactivate?
      user.administrador?
    end
  end