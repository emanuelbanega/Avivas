class StorefrontController < ApplicationController
  def index
    # Filtrado según categoría y búsqueda
    @products = Product.all

    if params[:category] && params[:category] != "all"
      @products = @products.where(category: params[:category])
    end

    if params[:query].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # Aplicando la paginación
    @products = @products.page(params[:page]).per(3)  # Muestra 9 productos por página
  end
end
