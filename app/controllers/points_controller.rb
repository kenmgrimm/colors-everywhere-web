class PointsController < ApplicationController
  before_action :set_points
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET strokes/1/points
  def index
    @points = @stroke.points
  end

  # GET strokes/1/points/1
  def show
  end

  # GET strokes/1/points/new
  def new
    @point = @stroke.points.build
  end

  # GET strokes/1/points/1/edit
  def edit
  end

  # POST strokes/1/points
  def create
    @point = @stroke.points.build(point_params)

    if @point.save
      redirect_to([@point.stroke, @point], notice: 'Point was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT strokes/1/points/1
  def update
    if @point.update_attributes(point_params)
      redirect_to([@point.stroke, @point], notice: 'Point was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE strokes/1/points/1
  def destroy
    @point.destroy

    redirect_to stroke_points_url(@stroke)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_points
      @stroke = Stroke.find(params[:stroke_id])
    end

    def set_point
      @point = @stroke.points.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_params
      params.require(:point).permit(:position_x, :position_y, :position_z)
    end
end
