class SoupsController < ApplicationController
	before_action :fetch_soup, only: [:show, :toggle_featured]

	def show
		respond_to do |format|
			format.html
			format.xml {render xml: @soup}
			format.json {render json: @soup}
		end
	end

	def index
		@soups = Soup.all

		respond_to do |format|
			format.html
			format.json {render json: @soup}
			format.xml {render xml: @soup}
		end 
	end

	def toggle_featured
		@soup.toggle!(:featured)
		flash[:notice] = "Successfully changed the featured flag."
		redirect_to @soup
	end

	def secret_soups
		session[:vip] = true
		redirect_to root_path
	end

	private 
	def fetch_soup
		@soup = Soup.find(params[:id])
	end
end
