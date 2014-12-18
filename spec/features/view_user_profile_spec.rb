require_relative 'features_helper'

feature 'Viewing user profile' do
  given(:user) { create(:user, description: 'descr') }
  given(:superadmin) { create(:superadmin, description: 'descr') }

  scenario 'Superadmin can see information about registered user' do
    login superadmin
    visit user_path(superadmin)

    expect(page).to have_text superadmin.name
    expect(page).to have_text superadmin.description
  end

  scenario 'Guest can not see information about registered user' do
    visit user_path(user)

    expect(page).to have_text 'У вас нет прав для данного действия'
    expect(page).to_not have_text user.description
  end

  scenario 'Signed in user can see information about himself' do
    login user
    click_link 'Мой аккаунт'

    expect(page).to have_text user.name
    expect(page).to have_text user.description
  end
end