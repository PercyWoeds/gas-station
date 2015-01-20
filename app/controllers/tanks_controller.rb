class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy, :add_gas, :fill]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all.order(:number)
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
    @tank = Tank.new(tank_params)

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
      if @tank.update(tank_params)
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
    @gasolines = Gasoline.options_for_select
    redirect_to gasolines_path, notice: 'Currently no gas added to fill tank with.' if @gasolines.empty?
  end

  # PUT /tanks/1
  # PUT /tanks/1.json
  def fill
    @gas = Gasoline.find(params[:tank][:gasoline_id])
    if @gas != @tank.gasoline && !@tank.empty? 
      redirect_to :back, notice: "Can't add different gas when tank is not empty" 
      return
    end
    new_fill = params[:tank][:filled].to_f.abs
    if new_fill > @tank.empty_space
      redirect_to :back, notice: "Can't fill in more than #{@tank.empty_space} liters" 
      return
    end
    respond_to do |format|
      @tank.gasoline = @gas
      new_amount = @tank.filled + new_fill
      if @tank.update(filled: new_amount)
        format.html { redirect_to @tank, notice: 'Tank was successfully filled with gas.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :add_gas }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    if !@tank.empty?
      redirect_to :back, notice: "Can't remove tank filled with gas." 
      return
    end
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
    def tank_params
      params.require(:tank).permit(:number, :volume, :filled, :gasoline_id)
    end
end
