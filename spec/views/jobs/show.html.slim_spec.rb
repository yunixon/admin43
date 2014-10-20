require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :employer_id => 1,
      :name => "Name",
      :body => "MyText",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
