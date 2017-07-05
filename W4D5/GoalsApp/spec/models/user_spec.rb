# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: "bob", password: "password") }

  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it {should have_many(:goals)}
  end

  describe "class methods" do
    before(:each) {user.save}

    describe "::find_by_credentials" do
      context 'with valid credentials' do
        it 'should return the user' do
          found_user = User.find_by_credentials("bob", "password")
          expect(found_user).to eq(user)
        end
      end

      context 'with invalid params' do
        it 'should return nil' do
          found_user = User.find_by_credentials("htee", "password")
          expect(found_user).to be(nil)
        end
      end

    end

    describe "#reset_session_token!" do
      it 'should reset the session token' do
        token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(token)
      end
    end
  end



end
