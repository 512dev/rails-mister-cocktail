class DosesController < ApplicationController
	def new
		@ingredients = Ingredient.all
		@cocktail = Cocktail.find(params[:cocktail_id])		
		@dose = Dose.new
	end
	def create
		@cocktail = Cocktail.find(params[:cocktail_id])
		@dose = @cocktail.doses.new(dose_params)
	      if @dose.save
			redirect_to cocktail_path(@cocktail)
		  else
	        render :new
		  end
	end
	def destroy
		@dose = Dose.find(params[:id])
	    @dose.destroy
	    respond_to do |format|
	      format.html { redirect_to dose_url, notice: 'dose was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end
	def dose_params
  	  params.require(:dose).permit(:description, :ingredient_id )
 	end
end
