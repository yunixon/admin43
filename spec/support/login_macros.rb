module LoginMacros

  def login_superadmin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      superadmin = FactoryGirl.create(:superadmin)
      sign_in :user, superadmin
    end
  end

  def login_employer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      employer = FactoryGirl.create(:employer)
      sign_in :user, employer
    end
  end
  
  def login_sysadmin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sysadmin = FactoryGirl.create(:sysadmin)
      sign_in :user, sysadmin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm!
      user.skip_confirmation_notification!
      sign_in user
    end
  end

end