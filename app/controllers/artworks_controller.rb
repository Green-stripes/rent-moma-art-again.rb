class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.all
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to root_path, notice: 'It was properly saved!' }
        format.json
      else
        format.html { render 'form', status: :unprocessable_entity }
        format.json
      end
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :artist, :cost_per_day, :culture, :completion_date, :medium, :image)
  end
end
