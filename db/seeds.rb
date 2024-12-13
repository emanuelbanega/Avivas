# Limpia la tabla de productos
Product.destroy_all

# Cantidad de productos a crear
PRODUCTS_COUNT = 50

puts "Creando #{PRODUCTS_COUNT} productos..."

PRODUCTS_COUNT.times do |i|
  Product.create!(
    name: "Producto #{i + 1}",
    description: "Descripción del producto #{i + 1}",
    unit_price: rand(5.0..100.0).round(2), # Precio aleatorio entre 5.0 y 100.0
    stock: rand(1..100), # Stock aleatorio entre 1 y 100
    category: ["Ropa", "Accesorios", "Deportes", "Tecnología"].sample, # Categoría de una lista
    size: ["S", "M", "L", "XL", "XXL"].sample, # Talla de una lista
    color: ["Rojo", "Azul", "Verde", "Negro", "Blanco"].sample, # Color de una lista
    removal_date: [nil, Time.now - rand(0..365).days].sample # Algunos productos sin removal_date
  )
end

puts "#{PRODUCTS_COUNT} productos creados exitosamente."