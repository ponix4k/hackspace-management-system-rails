require "rails_helper"

feature "Admin creates a user" do
  scenario "is redirected away if not an admin" do
    user = create(:user)
    login_as(user, scope: :user)
    visit new_admin_user_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content "You are not authorized to access this page."
  end

  scenario "successfully" do
    user = create(:user, :admin)
    login_as(user, scope: :user)
    visit new_admin_user_path
    fill_in "user_email", with: "user1@hs.com"
    fill_in "user_uid", with: "12345678"
    select "User", from: "user_role"
    click_on "Create User"

    expect(page).to have_content "user1@hs.com"
    expect(page).to have_content "12345678"
    expect(page).to have_content "user"
  end
end
