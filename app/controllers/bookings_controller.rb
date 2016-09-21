class BookingsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_show
	before_action :apply_coupoun, only: [:create]
	before_action :validate_time, only: [:create, :destroy]
	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(user: current_user, show: @show, total: @price)
		if @booking.save
			redirect_path("Booked at the price #{@booking.total}")
		else
			redirect_path('Something went Wrong')
		end
	end

	def destroy
		if current_user.bookings.where(show: @show).destroy_all
			redirect_path('Unbooked')
		else
			redirect_path('Something went wrong')
		end
	end

	private 

	def find_show
		@show = Show.find(params[:show_id])
	end

	def apply_coupoun
		@price = @show.movie.fee
		begin
			@coupoun = Coupon.find_by(name: params[:coupon])
			@price = (@price - (@coupoun.discount.to_f/@price * 100) ).to_i
		rescue => e
			@price	
		end
		
	end

	def validate_time
		if @show.start_time < Time.now
			redirect_to @show.movie, notice: 'you cannot do it'
		end
	end

	def redirect_path(notice=nil)
		redirect_to movie_path(@show.movie), notice: notice
	end

end
