require_relative 'features_helper'

feature 'Sign out' do
  context 'when signed in' do
    scenario 'user can sign out' do
      login_user

      visit '/'
      click_link 'Выйти'

      expect(page).not_to have_text 'Аккаунт'
      expect(page).not_to have_link 'Выйти'
    end
  end

  context 'when not signed in' do
    scenario 'user can not sign out' do
      visit '/'

      expect(page).not_to have_link 'Выйти'
    end
  end
end