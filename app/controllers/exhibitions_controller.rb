class ExhibitionsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_exhibition, only: %i[ show edit update destroy ]

  before_action only: [ :new, :create, :edit, :update, :destroy ] do
    authorize_request([ "author", "admin" ])
  end

  # GET /exhibitions or /exhibitions.json
  def index
    @exhibitions = Exhibition.order(created_at: :desc)
    @comment = Comment.new
  end

  # GET /exhibitions/1 or /exhibitions/1.json
  def show
    @comment = Comment.new
  end

  # GET /exhibitions/new
  def new
    @exhibition = Exhibition.new
  end

  # GET /exhibitions/1/edit
  def edit
  end

  # POST /exhibitions or /exhibitions.json
  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.user_id = current_user.id

    respond_to do |format|
      if @exhibition.save
        format.html { redirect_to @exhibition, notice: "Exhibitión creada" }
        format.json { render :show, status: :created, location: @exhibition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibitions/1 or /exhibitions/1.json
  def update
    respond_to do |format|
      if @exhibition.update(exhibition_params)
        format.html { redirect_to @exhibition, notice: "Exhibition was successfully updated." }
        format.json { render :show, status: :ok, location: @exhibition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibitions/1 or /exhibitions/1.json
  def destroy
    @exhibition.destroy!

    respond_to do |format|
      format.html { redirect_to exhibitions_path, status: :see_other, notice: "Exhibición fue eliminada" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exhibition_params
      params.require(:exhibition).permit(:title, :description, pictures: [])
    end
end
