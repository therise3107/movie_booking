class BookingsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_show, except: [:index]
	before_action :apply_coupoun, only: [:create]
	before_action :validate_time, only: [:create, :destroy]

	def index
		@bookings = current_user.bookings.includes(:show)
	end

	def show
		
	end

	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(user: current_user, show: @show, total: @price, movie_name: @show.movie.name)
		if @booking.save
			redirect_to bookings_path, notice: "Booked at the price #{@booking.total}"
		else
			redirect_to movie_path(@show.movie), alert: "Something went wrong"
		end
	end

	def destroy
		if current_user.bookings.where(show: @show).destroy_all
			redirect_to movie_path(@show.movie), notice: "UnBooked"
		else
			redirect_to movie_path(@show.movie), alert: "Something went wrong"
		end
	end

	private 

	def find_show
		@show = Show.find(params[:show_id])
	end

	def apply_coupoun
		@price = @show.movie.fee - current_user.gender_discount
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


end
