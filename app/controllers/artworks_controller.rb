class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to root_path
    else
      render 'form', status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist, :cost_per_day, :culture, :completion_date, :medium, :image)
  end
end
