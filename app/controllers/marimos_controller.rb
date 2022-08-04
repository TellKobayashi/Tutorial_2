class MarimosController < ApplicationController
  before_action :set_marimo, only: [:show, :edit, :update, :destroy]

  # GET /marimos
  # GET /marimos.json
  def index
    @marimos = Marimo.all
  end

  # GET /marimos/1
  # GET /marimos/1.json
  def show
  end

  # GET /marimos/new
  def new
    @marimo = Marimo.new
  end

  # GET /marimos/1/edit
  def edit
  end

  # POST /marimos
  # POST /marimos.json
  def create
    @marimo = Marimo.new(marimo_params)

    respond_to do |format|
      if @marimo.save
        format.html { redirect_to @marimo, notice: 'Marimo was successfully created.' }
        format.json { render :show, status: :created, location: @marimo }
      else
        format.html { render :new }
        format.json { render json: @marimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marimos/1
  # PATCH/PUT /marimos/1.json
  def update
    respond_to do |format|
      if @marimo.update(marimo_params)
        format.html { redirect_to @marimo, notice: 'Marimo was successfully updated.' }
        format.json { render :show, status: :ok, location: @marimo }
      else
        format.html { render :edit }
        format.json { render json: @marimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marimos/1
  # DELETE /marimos/1.json
  def destroy
    @marimo.destroy
    respond_to do |format|
      format.html { redirect_to marimos_url, notice: 'Marimo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marimo
      @marimo = Marimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marimo_params
      params.require(:marimo).permit(:name, :email)
    end
end
