require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe 'GET #index' do
    it 'should render public goals page'

    it 'should not show private goals'

    it 'should order by recency '
  end

  describe 'GET #new' do
    it 'should render new goal page' do
      get :new
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end

  end

  describe 'POST #create' do
    context "with valid parameters" do
      let!(:user) {User.create!(username: "guy", password: "guyguy")}

      before do
        post :create, goal: {title: "Goal"}
        allow(subject).to receive(:current_user) { user }
      end

      let(:goal) {Goal.find_by(title: "Goal")}
      # before {post :create, {goal: {title: "Goal"}}, session_token: user.session_token}

      it 'should add a goal' do
        expect(goal).not_to be_nil
      end

      it 'should redirect to the goal showpage' do
        expect(response).to redirect_to(goal_url(goal))
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid paramaters" do
      before {post :create, goal: {}}
      let(:goal) {Goal.find_by(title: "Goal")}

      it 'should not add a goal to the database' do
        expect(goal).to be_nil
      end
    end
  end

end
