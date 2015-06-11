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
