class ClausulasController < ApplicationController
  before_action :set_clausula, only: [:show, :edit, :update, :destroy]

  # GET /clausulas
  # GET /clausulas.json
  def index
    @clausulas = Clausula.all
  end

  # GET /clausulas/1
  # GET /clausulas/1.json
  def show
  end

  # GET /clausulas/new
  def new
    @clausula = Clausula.new
  end

  # GET /clausulas/1/edit
  def edit
  end

  # GET /contratos/1/clausulas
  def list
    @contrato = Contrato.find(params[:id])
    @clausulas = @contrato.clausulas
  end

  def list_add
    @contrato = Contrato.find(params[:id])
    @clausulas = Clausula.all
  end

  def add
    @clausula = Clausula.find(params[:clausula])
    @contrato = Contrato.find(params[:contrato])

    # Criando relação #
    tmp = Parte.new
    tmp.contrato = @contrato
    tmp.clausula = @clausula

    if tmp.save
      redirect_to list_clausulas_path(@contrato)
    else
      redirect_to list_add_clausulas_path(@contrato), notice: 'Ocorreu um erro!.'
    end
  end

  def remove
    @clausula = Clausula.find(params[:clausula])
    @contrato = Contrato.find(params[:contrato])

    # Apagando relação #
    @parte = Parte.find_by contrato_id: @contrato, clausula_id: @clausula
    @parte.destroy

    redirect_to list_clausulas_path(@contrato)

  end

  # POST /clausulas
  # POST /clausulas.json
  def create
    @clausula = Clausula.new(clausula_params)

    respond_to do |format|
      if @clausula.save
        format.html { redirect_to @clausula, notice: 'Clausula was successfully created.' }
        format.json { render :show, status: :created, location: @clausula }
      else
        format.html { render :new }
        format.json { render json: @clausula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clausulas/1
  # PATCH/PUT /clausulas/1.json
  def update
    respond_to do |format|
      if @clausula.update(clausula_params)
        format.html { redirect_to @clausula, notice: 'Clausula was successfully updated.' }
        format.json { render :show, status: :ok, location: @clausula }
      else
        format.html { render :edit }
        format.json { render json: @clausula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clausulas/1
  # DELETE /clausulas/1.json
  def destroy
    @clausula.destroy
    respond_to do |format|
      format.html { redirect_to clausulas_url, notice: 'Clausula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clausula
      @clausula = Clausula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clausula_params
      params.require(:clausula).permit(:titulo, :descricao)
    end
end
