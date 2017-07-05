require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
  subject(:user) {FactoryGirl.build(:user,
      email: "hello@gmail.com",
      password: "password")}

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }




    it "checks if a password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "knows when a password is wrong a password is not correct" do
      expect(user.is_password?("ffwefwfqw")).to be false
    end

    it "should create a new password digest if there is none " do
      expect(user.password_digest).to_not be_nil
    end

      it "if should create a session token after initialzation " do
        expect(user.session_token).to_not be_nil
      end

      describe "#reset_session_token!" do
        it "sets a new token for the user" do
          old = user.session_token
          user.reset_session_token!

          expect(user.session_token).to_not eq(old)
        end

        it "returns the new session token" do
          expect(user.reset_session_token!).to eq(user.session_token)
        end
      end


      describe ".find_by_credentials" do
        before { user.save! }

        it "returns user if they have the right credentials" do
          expect(User.find_by_credentials("hello@gmail.com", "password")).to eq(user)
        end

        it "returns nil with the wrong info" do
          expect(User.find_by_credentials("qegioegbw", "egwweewgw")).to eq(nil)
        end
      end

end
