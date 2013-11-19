class ScrapsController < ApplicationController
	def index
		@scraps = current_user.scraps
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

	def search
	end
	#display results
	# Displays results
  def search_results
    @scraps = Scrap.search(params[:search])
  
    #render :search_results
  end


	def create
  	@scrap = current_user.scraps.create(params.require(:scrap).permit(:search_tag, :body))
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