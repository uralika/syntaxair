require 'spec_helper'

describe ScrapsController do
	before do
		#Step 1, test_user
		#step 2, add test_scrap to test-user.scraps

		@testscraps = Scrap.create(search_tag: 'tag', body: 'body')
					 
		test_user = User.create(
			scraps: [@testscraps], 
			email: 'me@ga.com', 
			password: 'test', 
			password_confirmation: 'test')

		#mocks user for testing using stub
		ApplicationController.any_instance.stub(:current_user).and_return(test_user)
	end

	describe "GET #index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "assigns scraps" do
			@testscraps = Scrap.all
			get :index
			expect(assigns(:scrap)).to eq(@testscrap)
		end
	end

	describe "GET #new" do
		it "renders a new template" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "GET #show" do
		before :each do 
			@scrap = Scrap.create(body: "string", search_tag: "string")
		end

		it "responds to GET" do
      get :show, id: @scrap.id
      expect(assigns(:scrap)).to eq(@scrap)
    end

    it "renders the :show template" do
    	get :show, id: @scrap.id
    	expect(response).to render_template("show")
    end
	end

	describe 'POST #create' do 
    it "posts the scrap" do
    	expect{ 
    		post :create, {scrap: {body: "string", search_tag: "string"}} 
    	}.to change(Scrap,:count).by(1)
    end
        
    it "redirects to scraps#index" do 
			post :create, {scrap: {body: "string", search_tag: "string"}} 
			response.should redirect_to scraps_url 
		end
	end	

	describe 'DELETE #destroy' do 
		before :each do 
			@scrap = Scrap.create(body: "string", search_tag: "string")
		end

		it "deletes the scrap" do 
			expect{ 
				delete :destroy, id: @scrap.id 
			}.to change(Scrap,:count).by(-1) 
		end

		it "redirects to scraps#index" do 
			delete :destroy, id: @scrap.id 
			response.should redirect_to scraps_url 
		end 
	end 
end
