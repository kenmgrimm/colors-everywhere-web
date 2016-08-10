class StrokesController < ApplicationController
  before_action :set_strokes
  before_action :set_stroke, only: [:show, :edit, :update, :destroy]

  # GET paintings/1/strokes
  def index
    @strokes = @painting.strokes
  end

  # GET paintings/1/strokes/1
  def show
  end

  # GET paintings/1/strokes/new
  def new
    @stroke = @painting.strokes.build
  end

  # GET paintings/1/strokes/1/edit
  def edit
  end

  # POST paintings/1/strokes
  def create
    @stroke = @painting.strokes.build(stroke_params)

    if @stroke.save
      redirect_to([@stroke.painting, @stroke], notice: 'Stroke was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT paintings/1/strokes/1
  def update
    if @stroke.update_attributes(stroke_params)
      redirect_to([@stroke.painting, @stroke], notice: 'Stroke was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE paintings/1/strokes/1
  def destroy
    @stroke.destroy

    redirect_to painting_strokes_url(@painting)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strokes
      @painting = Painting.find(stroke_params[:painting_id])
    end

    def set_stroke
      @stroke = @painting.strokes.find(stroke_params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stroke_params
      params.require(:stroke).permit(:brush_type, :color, :brush_width)
    end
end
