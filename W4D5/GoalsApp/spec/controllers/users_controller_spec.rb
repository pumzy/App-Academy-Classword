require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it 'renders the sign up page' do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      before {post :create, user: {username: "fred", password: "123456"}}
      let(:user) { User.find_by_credentials("fred", "123456") }


      it 'adds user to the database' do
        expect(user).not_to be(nil)
      end

      it 'redirects to appropriate page' do
        expect(response).to redirect_to(user_url(user))
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid params' do
      before {post :create, user: {username: "tim"}}

      it 'should not add user to the database' do
        expect(User.find_by(username: "tim")).to be(nil)
      end

      it 'renders the sign up page' do
        expect(response).to render_template("new")
        expect(response).to have_http_status(422)
      end

      it 'should flash error' do
        expect(flash[:errors]).not_to be_empty
      end
    end
  end
end
