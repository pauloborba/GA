class GAsController < ApplicationController
  before_action :set_ga, only: [:show, :edit, :update, :destroy]

  # GET /gas
  # GET /gas.json
  def index
    @gas = Ga.all
  end

  # GET /gas/1
  # GET /gas/1.json
  def show
  end

  # GET /gas/new
  def new
    @ga = Ga.new
  end

  # GET /gas/1/edit
  def edit
  end

  # POST /gas
  # POST /gas.json
  def create
    @ga = Ga.new(ga_params)

    respond_to do |format|
      if @ga.save
        format.html { redirect_to @ga, notice: 'Ga was successfully created.' }
        format.json { render :show, status: :created, location: @ga }
      else
        format.html { render :new }
        format.json { render json: @ga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gas/1
  # PATCH/PUT /gas/1.json
  def update
    respond_to do |format|
      if @ga.update(ga_params)
        format.html { redirect_to @ga, notice: 'Ga was successfully updated.' }
        format.json { render :show, status: :ok, location: @ga }
      else
        format.html { render :edit }
        format.json { render json: @ga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas/1
  # DELETE /gas/1.json
  def destroy
    @ga.destroy
    respond_to do |format|
      format.html { redirect_to gas_url, notice: 'Ga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ga
      @ga = Ga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ga_params
      params.require(:ga).permit(:nome)
    end
end
