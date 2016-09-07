require 'zlib'
require 'stringio'


class PaintingsController < ApplicationController
  include PaintingsHelper

  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.order(id: :desc).limit(20)

    respond_to do |format|
      format.html do
        render :index
      end
      format.json do
        render json: @paintings
      end
    end
  end

  def map_data
    paintings = Painting.summary

    render json: { paintingSummaries: paintings }
  end

  def show
    render json: @painting.api_json
  end

  def new
    @painting = Painting.new
  end

  def edit
  end

  def create
    full_payload = JSON.parse(painting_params)
    full_payload.delete('id')

    create_params = full_payload.clone
    create_params.delete('strokeDatas')

    painting = Painting.new(create_params.merge({ data: full_payload }))

    if painting.save
      render json: painting
    else
      render json: painting.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @painting.update_attribute(:data, painting_params)
        format.html { redirect_to @painting, notice: 'Painting was successfully updated.' }
        format.json { render json: @painting }
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
      stroke.delete('id')
      # For now these are an array of serialized vectors on the app end so we get x, y, z and need to translate here.  Need to fix
      stroke['points_attributes'] = stroke.delete('points')

      stroke['points_attributes'].each do |point|
        point[:position_x] = point.delete('x')
        point[:position_y] = point.delete('y')
        point[:position_z] = point.delete('z')
      end
    end

    def painting_params
      gz = Zlib::GzipReader.new(StringIO.new(Base64.decode64(params.require(:painting))))

      gz.read
    end
end
