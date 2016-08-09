class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.order(id: :desc).limit(20)
  end

  def show
    render json: @painting
  end

  def new
    @painting = Painting.new
  end

  def edit
  end

  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to @painting, notice: 'Painting was successfully created.' }
        format.json { render json: @painting }
      else
        format.html { render :new }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to @painting, notice: 'Painting was successfully updated.' }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :edit }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_url, notice: 'Painting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_painting
      @painting = Painting.find(params[:id])
    end

    def transform_stroke_input stroke
      stroke['points_attributes'] = stroke.delete('points')

      stroke['points_attributes'].each do |point|
        point[:position_x] = point.delete('x')
        point[:position_y] = point.delete('y')
        point[:position_z] = point.delete('z')
      end
    end

    def painting_params
      painting_json = JSON.parse(params.require(:painting))

      painting_json[:strokes_attributes] = painting_json.delete('strokes')

      painting_json[:strokes_attributes].each do |stroke|
        transform_stroke_input(stroke)
      end

      painting_json
    end
end




