class ScrapsController < ApplicationController
respond_to :html, :json
before_action :set_scrap, only: [:update]

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
    Scrap.order('rank DESC')
  
    #render :search_results
  end

  def edit
    @scrap = Scrap.find(params[:id])
  end


	def create
  	@scrap = current_user.scraps.create(params.require(:scrap).permit(:search_tag, :body))
  	if @scrap.valid?
  		redirect_to scraps_url
  	else
  		render :new
  	end
	end

  def update
    respond_to do |format|
      if @scrap.update(scrap_params)
        format.html { redirect_to @scrap, notice: 'Code updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scrap.errors, status: :unprocessable_entity }
      end
    end
  end
	  
	def destroy
    @scrap = Scrap.find(params[:id]).destroy
    redirect_to scraps_url
  end

  private

  def set_scrap
      @scrap = Scrap.find(params[:id])
  end

  def scrap_params
      params.require(:scrap).permit(:search_tag, :body)
  end

end





