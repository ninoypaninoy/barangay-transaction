class OfficialsController < ApplicationController
  before_action :set_official, only: [:show, :edit, :update, :destroy]

  # GET /officials
  # GET /officials.json
  def index
    @officials = Official.all
  end
 
  # GET /officials/1
  # GET /officials/1.json
  def show
  end

  # GET /officials/new
  def new
    @official = Official.new
  end

  # GET /officials/1/edit
  def edit
  end

  # POST /officials
  # POST /officials.json
  def create
    @official = Official.new(official_params)

    respond_to do |format|
      if @official.save
        format.html { redirect_to @official, notice: 'Official was successfully created.' }
        format.json { render :show, status: :created, location: @official }
      else
        format.html { render :new }
        format.json { render json: @official.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officials/1
  # PATCH/PUT /officials/1.json
  def update
    respond_to do |format|
      if @official.update(official_params)
        format.html { redirect_to @official, notice: 'Official was successfully updated.' }
        format.json { render :show, status: :ok, location: @official }
      else
        format.html { render :edit }
        format.json { render json: @official.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officials/1
  # DELETE /officials/1.json
  def destroy
    @official.destroy
    respond_to do |format|
      format.html { redirect_to officials_url, notice: 'Official was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_official
      @official = Official.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def official_params
      params.require(:official).permit(:official_first_name, :official_middle_name, :official_last_name, :official_position)
    end
end
