class ScrapsController < ApplicationController
respond_to :html, :json

	def index
		@scraps = current_user.scraps
		# @scrap_models = Scrap.select(:body).distinct.order(:body)
    respond_with(@scraps)
	end

	def new
  		@scrap = Scrap.new
      respond_with(@scrap)
 	end

	def show
	  @scrap = Scrap.find(params[:id])
    respond_with(@scrap)
	end

	def search
	end
	#display results
	# Displays results
  def search_results
    @scraps = Scrap.search(params[:search])
    respond_with(@scrap)
  
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