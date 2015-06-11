class AtletasController < ApplicationController
  before_action :set_atleta, only: [:show, :edit, :update, :destroy]

  # GET /atletas
  # GET /atletas.json
  def index
    @atletas = Atleta.all
  end

  # GET /atletas/1
  # GET /atletas/1.json
  def show
  end

  # GET /atletas/new
  def new
    @atleta = Atleta.new
  end

  # GET /atletas/1/edit
  def edit
  end

  # POST /atletas
  # POST /atletas.json
  def create
    @atleta = Atleta.new(atleta_params)

    respond_to do |format|
      if @atleta.save
        format.html { redirect_to @atleta, notice: 'Atleta was successfully created.' }
        format.json { render :show, status: :created, location: @atleta }
      else
        format.html { render :new }
        format.json { render json: @atleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atletas/1
  # PATCH/PUT /atletas/1.json
  def update
    respond_to do |format|
      if @atleta.update(atleta_params)
        format.html { redirect_to @atleta, notice: 'Atleta was successfully updated.' }
        format.json { render :show, status: :ok, location: @atleta }
      else
        format.html { render :edit }
        format.json { render json: @atleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atletas/1
  # DELETE /atletas/1.json
  def destroy
    @atleta.destroy
    respond_to do |format|
      format.html { redirect_to atletas_url, notice: 'Atleta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atleta
      @atleta = Atleta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atleta_params
      params.require(:atleta).permit(:nome, :email, :telefone, :data_nascimento, :cpf, :rg, :altura, :peso, :posicao_joga, :categoria, :alojamento_clube)
    end
end
