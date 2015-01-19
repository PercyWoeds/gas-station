class GasolinesController < ApplicationController
  before_action :set_gasoline, only: [:show, :edit, :update, :destroy]

  # GET /gasolines
  # GET /gasolines.json
  def index
    @gasolines = Gasoline.all
  end

  # GET /gasolines/1
  # GET /gasolines/1.json
  def show
  end

  # GET /gasolines/new
  def new
    @gasoline = Gasoline.new
  end

  # GET /gasolines/1/edit
  def edit
  end

  # POST /gasolines
  # POST /gasolines.json
  def create
    @gasoline = Gasoline.new(gasoline_params)

    respond_to do |format|
      if @gasoline.save
        format.html { redirect_to @gasoline, notice: 'Gasoline was successfully created.' }
        format.json { render :show, status: :created, location: @gasoline }
      else
        format.html { render :new }
        format.json { render json: @gasoline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gasolines/1
  # PATCH/PUT /gasolines/1.json
  def update
    respond_to do |format|
      if @gasoline.update(gasoline_params)
        format.html { redirect_to @gasoline, notice: 'Gasoline was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasoline }
      else
        format.html { render :edit }
        format.json { render json: @gasoline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gasolines/1
  # DELETE /gasolines/1.json
  def destroy
    @gasoline.destroy
    respond_to do |format|
      format.html { redirect_to gasolines_url, notice: 'Gasoline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasoline
      @gasoline = Gasoline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasoline_params
      params.require(:gasoline).permit(:name, :class, :price)
    end
end
