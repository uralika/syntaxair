class ScrapsController < ApplicationController
	def index
		@scraps = Scrap.all
		# @scrap_models = Scrap.select(:body).distinct.order(:body)
	end

	def show_json
	  	# render json: Scrap.where(model: params[:model]).order(:scrap_name).reverse
	end

	def new
  		@scrap = Scrap.new
 	end

	def show
	  	@scrap = Scrap.find(params[:id])
	end

	def create
	  	@scrap = Scrap.create(params.require(:scrap).permit(:search_tag, :body))
	  	if @scrap.valid?
	  		redirect_to scraps_url
	  	else
	  		render :new
	  	end
	end
	  
	def destroy
	    @scrap = Scrap.find(params[:id]).destroy
	    redirect_to scraps_url
    end

end