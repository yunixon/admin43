require_relative 'features_helper'

feature 'Sign in' do
  scenario 'User can sign in with valid email and password' do
    login_user

    expect(page).to have_content 'Вход в систему выполнен.'
  end

  scenario 'User can not sign in with invalid email or password' do
    visit '/'
    click_link 'Войти'
    fill_in 'Адрес электронной почты', with: 'wrong@user.com'
    fill_in 'Пароль', with: 'invalid-password'
    click_button 'Войти'

    expect(page).to have_content 'Неверный email или пароль.'
  end
end