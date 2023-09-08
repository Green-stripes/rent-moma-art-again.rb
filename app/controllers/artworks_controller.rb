class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    @artwork = Artwork.new
  end

  # def new
  #   @artwork = Artwork.new
  # end

  def create
    @artwork = Artwork.new(artwork_params)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist, :cost_per_day, :culture, :completion_date, :medium, :image)
  end
end
