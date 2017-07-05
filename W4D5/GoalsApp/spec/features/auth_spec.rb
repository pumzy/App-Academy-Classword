require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit 'users/new'
    expect(page).to have_content 'Sign Up'
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit 'users/new'
      fill_in('username', with: 'Fred')
      fill_in('password', with: 'password')
      click_button('Sign Up!')
      expect(page).to have_content 'Fred'
    end



  end


  background { User.create(username: 'Bob', password: 'password')}

  feature "logging in" do
    scenario "shows username on the homepage after login" do
      sign_in
      expect(page).to have_content 'Bob'
    end

  end

  feature "logging out" do

    scenario "begins with a logged out state" do
      visit ''
      expect(page).not_to have_content 'Bob'
    end

    scenario "doesn't show username on the homepage after logout" do
      sign_in
      click_button('Log Out')
      expect(page).not_to have_content 'Bob'
    end

  end

end
