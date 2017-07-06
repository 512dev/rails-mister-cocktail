class CocktailsController < ApplicationController

	def new
    	@cocktail = Cocktail.new
  	end

	def index
		@cocktails = Cocktail.all
	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end

	def edit
		@cocktail = Cocktail.find(params[:id])
	end
	def create
		  @cocktail = Cocktail.new(cocktail_params)

	    respond_to do |format|
	      if @cocktail.save
	        format.html { redirect_to @cocktail, notice: 'cocktail was successfully created.' }
	        format.json { render :show, status: :created, location: @cocktail }
	      else
	        format.html { render :new }
	        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def update
		@cocktail = Cocktail.find(params[:id])
    	respond_to do |format|
	      if @cocktail.update(restaurant_params)
	        format.html { redirect_to @cocktail, notice: 'cocktail was successfully updated.' }
	        format.json { render :show, status: :ok, location: @cocktail }
	      else
	        format.html { render :edit }
	        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
	      end
    	end
  	end
  	def destroy
  		@cocktail = Cocktail.find(params[:id])
	    @cocktail.destroy
	    respond_to do |format|
	      format.html { redirect_to cocktail_url, notice: 'cocktail was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end
  def cocktail_params
  	params.require(:cocktail).permit(:name)
  end

end
