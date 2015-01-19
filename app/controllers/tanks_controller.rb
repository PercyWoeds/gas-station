class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy, :add_gas, :fill]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
  end

  # GET /tanks/new
  def new
    @tank = Tank.new
  end

  # GET /tanks/1/edit
  def edit
  end

  # POST /tanks
  # POST /tanks.json
  def create
    @tank = Tank.new(new_tank_params)

    respond_to do |format|
      if @tank.save
        format.html { redirect_to @tank, notice: 'Tank was successfully added.' }
        format.json { render :show, status: :created, location: @tank }
      else
        format.html { render :new }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    respond_to do |format|
      if @tank.update(new_tank_params)
        format.html { redirect_to @tank, notice: 'Tank info was successfully updated.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tanks/1/add_gas
  def add_gas
    @filling = true
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def fill
    respond_to do |format|
      if @tank.update(fill_tank_params)
        format.html { redirect_to @tank, notice: 'Tank was successfully filled with gas.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to tanks_url, notice: 'Tank was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_tank_params
      params.require(:tank).permit(:number, :volume)
    end

    def fill_tank_params
      params.require(:tank).permit(:filled, :gasoline_id)
    end
end
