require 'spec_helper'

describe UsersController do



describe "GET #index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
end
		it "assigns users" do
			@users = User.all
			get :index
		 	expect(assigns(:user)).to eq(@user)
		end
 end

 describe "new #user" do
 		it "makes a new user" do
 			@users = User.create
 			# post :users
 			expect(response).to render_template(@user)
		end
	end

	
