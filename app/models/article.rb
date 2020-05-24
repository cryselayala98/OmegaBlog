class Article < ApplicationRecord
  
  # Validaciones del artículo
  # tanto el título como la descripción deben aparecer obligatoriamente y ambas tienen un tamaño límite min y max de caracteres
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300}  

end