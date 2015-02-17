class MoviesController < ApplicationController
	before_filter :set_filters

	def set_filters
		if not session[:ratings]
			puts "SESSION RATINGS SET BY FILTER"
			puts session[:ratings]
			session[:ratings] = {"G"=> 1, "PG"=> 1, "PG-13"=> 1, "R"=> 1} 
		end
	end

	def show
		id = params[:id] # retrieve movie ID from URI route
		@movie = Movie.find(id) # look up movie by unique ID
		# will render app/views/movies/show.<extension> by default
	end

	def index
		@all_ratings = Movie.all_ratings
		filters = []
		sort_type = params[:index]
		if not params[:ratings] then 
			puts 'REDIRECT'
			redirect_to movies_path(:ratings => session[:ratings])
		else
			params[:ratings].each do |rating, value| filters.append(rating) end 
			if not sort_type then sort_type = session[:index] end 
			@movies = Movie.where({rating: filters})

			# if sort_type == 'title' then
			# 	@movies = Movie.order(:title).all
			# elsif sort_type == 'release_date' then
			# 	@movies = Movie.order(:release_date).all
			# end
		session[:ratings] = params[:ratings]
		puts 'set session'
		puts session
		session[:index] = sort_type
		end
	end

	def new
		# default: render 'new' template
	end

	def create
		@movie = Movie.create!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end

	def edit
		@movie = Movie.find params[:id]
	end

	def update
		@movie = Movie.find params[:id]
		@movie.update_attributes!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully updated."
		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end

end
