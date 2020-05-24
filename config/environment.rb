# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# no mostrar el campo de error que Rails genera por defecto cuando un proceso (ej formulario) no cumple con las especificaciones mínimas

# luego de colocar estas líneas, se debe reiniciar la aplicación

# cuando un request de un form devuelve un error, las clases de las etiquetas de html del form se modifican a las que por defecto rails tiene para errores,  en este caso se quiere quitar eso, para dejar la página como estaba antes, a excepción del mensaje de error
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end