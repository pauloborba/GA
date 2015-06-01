class PartidasController < ApplicationController
  before_action :set_partida, only: [:show, :edit, :update, :destroy]

  # GET /partidas
  # GET /partidas.json
  def index
    @partidas = Partida.all
  end

  # GET /partidas/1
  # GET /partidas/1.json
  def show
  end

  # GET /partidas/new
  def new
    @partida = Partida.new
  end

  # GET /partidas/1/edit
  def edit
  end

  # POST /partidas
  # POST /partidas.json
  def create
    @partida = Partida.new(partida_params)

    respond_to do |format|
      if @partida.save
        format.html { redirect_to @partida, notice: 'Partida was successfully created.' }
        format.json { render :show, status: :created, location: @partida }
      else
        format.html { render :new }
        format.json { render json: @partida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partidas/1
  # PATCH/PUT /partidas/1.json
  def update
    respond_to do |format|
      if @partida.update(partida_params)
        format.html { redirect_to @partida, notice: 'Partida was successfully updated.' }
        format.json { render :show, status: :ok, location: @partida }
      else
        format.html { render :edit }
        format.json { render json: @partida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partidas/1
  # DELETE /partidas/1.json
  def destroy
    @partida.destroy
    respond_to do |format|
      format.html { redirect_to partidas_url, notice: 'Partida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partida
      @partida = Partida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partida_params
      params.require(:partida).permit(:nome, :tag, :data)
    end
end
