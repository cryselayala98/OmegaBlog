class ArticlesController < ApplicationController

  # esto se hará en mientras recibe una solicitud: consultar un artículo por su id
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # byebug #  Call 'byebug' anywhere in the code to stop execution and get a debugger console. 
    # byebug -> Es una gema que viene por defecto al crear un proyecto y sirve para detener la ejecución y hacer debug en este punto del código, luego desde la consola puede el usuario mostrar los valores asociados a las asignaciones en esta línea de código, para revisar. Para que continúe la ejecución, en la consola se escribe 'continue'.
    # @article = Article.find(params[:id]) # ya lo hace el set_article
  end

  def new
    # es necesario hacer esto para que se puedan desplegar los errores, en caso de que existan
    @article = Article.new 
  end

  def edit
    # colocar la info del artículo pasando el id de la url
    # @article = Article.find(params[:id]) # ya lo hace el set_article
  end
   
  def create 
    # @article = Article.new(params.require(:article).permit(:title, :description))
    # article_params es una funcion auxiliar creada en este controlador para recibir los datos del request form
    @article = Article.new(article_params)

    if @article.save

      # guardar mensaje en flash
      flash[:notice] = "El artículo fué guardado exitosamente."
      redirect_to @article 

    else
      render 'new'
    end

  end 

  def update
   
    # @article = Article.find(params[:id]) # ya lo hace el set_article
    
    # if @article.update(params.require(:article).permit(:title, :description))
    if @article.update(article_params)
      flash[:notice] = "El artículo fué actualizado exitosamente."
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy

    # @article = Article.find(params[:id]) # ya lo hace el set_article
    @article.destroy
    flash[:notice] = "El artículo ha sido eliminado."
    redirect_to articles_path

  end

  private

  def set_article

    @article = Article.find(params[:id])

  end

  def article_params

    params.require(:article).permit(:title, :description)
    
  end

end 