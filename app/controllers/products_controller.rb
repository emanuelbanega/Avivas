class ProductsController < ApplicationController
    def index
        @products = Product.where(removal_date: nil)
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to products_path, notice: '¡Producto creado exitosamente!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to products_path, notice: '¡Producto editado exitosamente!'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])

        if @product.soft_delete
            redirect_to products_path, notice: '¡Producto eliminado exitosamente!', status: :see_other
        else
        redirect_to products_path, alert: 'Hubo un problema al eliminar el producto.'
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :unit_price, :stock, :category, :size, :color)
    end
end