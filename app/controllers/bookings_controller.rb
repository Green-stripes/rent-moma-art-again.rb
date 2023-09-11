class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @artwork = Artwork.find(params[:artwork_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.artwork = Artwork.find(params[:artwork_id])
    @booking.user = current_user
    @booking.total_cost = @booking.artwork.cost_per_day

    if @booking.save
      redirect_to artwork_path(@booking.artwork)
    else
      render "new", status: :unprocessable_entity
    end
  end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end

# def total_cost_params
#   params.require(:booking).permit(:start_date(3i), :end_date)
# end

end
