require 'spec_helper'

describe ScrapsController do
before do
		@testscraps = Scrap.create(scrap_name:'Javascript')
	#Step 1, test_user
	#step 2, add test_scrap to test-user.scraps 
	test_user = User.create(scraps: [@testscraps])

	#mocks user for testing
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
			it "responds to GET" do
          # get :show, :id @testscrap
          expect(assigns(:scrap)).to eq(@testscrap)
        end
        # it "renders the :show template" do
        	# get :show, id: @testscrap
        	# expect(response).to render_template("show")
    # end
end

	describe "POST #create" do
		it "creates a new scrap" do
			# post :create, scrap: @tester_scrap
   #        expect(Scrap.last.scrap_name).to eq(tester_scrap[:scrap_name])
        end
end
        # it "should redirect to index" do
        # 	expect {post :create, scrap: FactoryGirl.attributes_for(:scrap)}.to change(Scrap, :count).by(1)
        # 	#response.should redirect_to "index"
        # 	expect(response).to redirect_to("index")
        # end
		
# 	end

# end
	describe 'DELETE destroy' do 
	before :each do @scrap = Scrap(:id) 
	end

		 # it "deletes the scrap" do 
		 # expect{ delete :destroy, id: @scrap }.to change(Scrap,:count).by(-1) 
		 # end

		 # it "redirects to contacts#index" do 
		 # delete :destroy, id: @scrap response.should redirect_to scraps_url 
		 
	# end 
# end 
 end
end

