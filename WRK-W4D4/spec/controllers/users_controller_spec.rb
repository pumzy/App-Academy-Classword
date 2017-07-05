require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  ibe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password"
        post :create, user: {email: "fwefwgwf", password: ""}
        expect(response).to redirect_to(new_session_url)
        expect(flash[:errors]).to be_present
      it "validates that the password is at least 6 characters long"
        post :create, user: {email: "hello@gmail.com", password: "fqf"}
        expect(response).to redirect_to(new_session_url)
        expect(flash[:errors]).to be_present
    end

    context "with valid params" do
      it "redirects user to bands index on success"
      post :create, user: {email: "hello@gmail.com",
      password: "password"}
      expect(response).to redirect_to(new_session_url)
    end
  end
end
end
