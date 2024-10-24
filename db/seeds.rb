# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
# Ruta a las imágenes en el directorio db/seeds/images


User.create!(
  email: "karina@karipic.cl",
  password: "123456",
  name: "Karina",
  role: 1,
  picture: File.open(Rails.root.join("db/seeds/karina.jpg")))

# Ruta a las imágenes en el directorio db/seeds/images
image1_path = Dir["#{Rails.root}/db/seeds/images1/*.jpg"]

# Crea la instancia de Exhibition primero
exhibition = Exhibition.create!(
  title: "Tres Mundos, M.C. Escher",
  description: "M.C. Escher, es uno de los más grandes artistas gráficos del siglo XX. Tal vez la mejor definición que se ha dado de él sea la de «uno de los más reconocibles y admirados por el gran público». Esto viene a decir que muchas personas admiran y encuentran curiosos, intrigantes y bonitos sus trabajos.\nSus más populares obras, figuras imposibles, fondos reticulados con diversos patrones y mundos imaginarios han sido reproducidas hasta la saciedad en portadas de libros, revistas, campañas publicitarias y en todo tipo de formatos.",
  user_id: User.last.id)

# Se adjuntan múltiples imágenes a la instancia creada
image1_path.each do |image_path|
  exhibition.pictures.attach(io: File.open(image_path), filename: File.basename(image_path))
end


# Ruta a las imágenes en el directorio db/seeds/images
image2_path = Dir["#{Rails.root}/db/seeds/images2/*.jpg"]

exhibition = Exhibition.create!(
  title: "Un Mundo, M.C. Escher",
  description: "Dado que sus obras guardan ciertas similitudes entre sí debido a la recurrencia de los temas tratados son fácilmente reconocibles.\nTal vez el carácter matemático de sus obras ha hecho también que sea uno de los artistas más populares en los entornos científicos, especialmente matemáticos e informáticos. Curiosamente, sus conocimientos matemáticos siempre fueron muy limitados. Muchas de las conclusiones gráficas y matemáticas a las que llegó, que le permitirían realizar algunos de sus trabajos.",
  user_id: User.last.id)

# Se adjuntan múltiples imágenes a la instancia creada
image2_path.each do |image_path|
  exhibition.pictures.attach(io: File.open(image_path), filename: File.basename(image_path))
end

puts "Se creó el User Karina y 2 Exhibitions con imágenes para demo"
