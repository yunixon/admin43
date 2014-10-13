require 'rails_helper'

RSpec.describe "resumes/index", :type => :view do
  before(:each) do
    assign(:resumes, [
      Resume.create!(
        :user_id => 1,
        :body => "MyText",
        :status => 2
      ),
      Resume.create!(
        :user_id => 1,
        :body => "MyText",
        :status => 2
      )
    ])
  end

  it "renders a list of resumes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
