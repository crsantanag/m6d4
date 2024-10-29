class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_exhibition, only: [ :create ]

  before_action only: [ :destroy ] do
    authorize_request([ "author", "admin" ])
  end

  def index
    @comment = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    if user_signed_in? && @exhibition.present?
      @comment.user_id = current_user.id
      @comment.exhibition_id = @exhibition.id
    else
      redirect_to exhibition_path(@exhibition.id), notice: "Debe iniciar sesión para comentar."
      return
    end

    respond_to do |format|
      if @comment.save
          format.html { redirect_to exhibition_path(@exhibition.id), notice: "Comentario creado." }
      else
        logger.error @comment.errors.full_messages
        format.html { redirect_to exhibition_path(@exhibition.id), notice: "Comentario no pudo ser creado." }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to exhibition_path(params[:exhibition_id]), notice: "Comentario eliminado" }
      else
        logger.error @comment.errors.full_messages
        format.html { redirect_to exhibition_path(params[:exhibition_id]), notice: "Comentario no pudo ser eliminado" }
      end
    end
  end

  private

  def set_exhibition
    puts "entró"
    @exhibition = Exhibition.find(params[:comment][:exhibition_id])  # Aquí obtengo la exhibición según el ID pasado en la ruta
    puts "salió"
  end

  def comment_params
    params.require(:comment).permit(:context, :user_id, :exhibition_id)
  end
end
