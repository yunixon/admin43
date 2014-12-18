require_relative 'features_helper'

feature 'Sign in with Facebook account' do
  let(:user) { create :user }

  def valid_credentials(user)
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook', uid: '123545',
      info: { name: user[:name], email: user[:email] },
      extra: { raw_info: { name: user[:name], email: user[:email] } }
    })
  end

  before { visit new_user_session_path }

  context 'already registered' do
    scenario 'user can sign in with valid credentials' do
      valid_credentials user
      click_link 'Войти с Facebook'

      expect(page).to have_content 'Вход в систему выполнен с учётной записью из Facebook.'
    end
  end

  context 'not registered' do
    scenario 'user can sign in with valid credentials' do
      valid_credentials name: 'John Doe', email: 'john@doe.com'
      click_link 'Войти с Facebook'

      expect(page).to have_content 'Завершение регистрации'
      
      fill_in 'Фамилия Имя', with: 'John Doe'
      fill_in 'Адрес электронной почты', with: 'john@doe.com'
      click_button 'Продолжить'

      expect(page).to have_content 'Регистрация завершена'
    end
  end

  scenario 'user can not login with invalid credentials' do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    silence_omniauth { click_link 'Войти с Facebook' }

    expect(page).to have_content 'Вы не можете войти в систему с учётной записью из Facebook'
  end
end