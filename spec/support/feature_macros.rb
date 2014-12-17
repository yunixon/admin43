module FeatureMacros
  def login_user
    login create(:user)
  end

  def login(user)
    visit '/'
    click_link 'Войти'
    fill_in 'Адрес электронной почты', with: user.email
    fill_in 'Пароль', with: user.password
    click_button 'Войти'
  end

  def silence_omniauth
    previous_logger = OmniAuth.config.logger
    OmniAuth.config.logger = Logger.new('/dev/null')
    yield
  ensure
    OmniAuth.config.logger = previous_logger
  end
end